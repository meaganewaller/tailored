# app/jobs/bulk_upload_processing_job.rb
class BulkUploadProcessingJob < ApplicationJob
  queue_as :default

  def perform(resource_id, resource_class_name, image_key)
    resource_class = resource_class_name.constantize
    resource = resource_class.find(resource_id)

    return unless resource.images.attached?

    Google::Cloud::Vision.configure { |vision| vision.credentials = Rails.application.credentials.dig(:google, :service_key) }

    image = resource.images.joins(:blob).find_by(active_storage_blobs: {key: image_key})

    saved = 0
    unsaved = 0

    if image
      tags = tag_image_with_ai(image)
      colors = detect_colors(image)
      resource.update(tags:, colors:)
      if resource.save
        saved + 1
      else
        unsaved + 1
      end
    end

    BulkUploadWardrobeItemsNotifier.with(account:).deliver(resource.owner)
  end

  private

  def detect_colors(image)
    vision = Google::Cloud::Vision.image_annotator
    image_file = StringIO.new(image.download)
    response = vision.image_properties_detection(image: image_file)

    return [] if response.responses.empty? || response.responses.first.image_properties_annotation.nil?

    # Extract dominant colors from the response
    dominant_colors = response.responses.first.image_properties_annotation.dominant_colors.colors

    # Get hex values or descriptive colors from the dominant colors
    dominant_colors.map do |color_info|
      {
        hex: hex_color_from_rgb(color_info.color),
        score: color_info.score
      }
    end
  end

  def tag_image_with_ai(image)
    arr = []

    vision = Google::Cloud::Vision.image_annotator
    image_file = StringIO.new(image.download)
    response = vision.label_detection(image: image_file)

    response.responses.each do |res|
      res.label_annotations.each do |label|
        arr.push(label.description) if label.score > 0.85
      end
    end

    arr
  end

  def hex_color_from_rgb(color)
    red = color.red.to_i
    green = color.green.to_i
    blue = color.blue.to_i
    "#%02x%02x%02x" % [red, green, blue]
  end
end
