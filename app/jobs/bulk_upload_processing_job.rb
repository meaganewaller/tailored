# app/jobs/bulk_upload_processing_job.rb
class BulkUploadProcessingJob < ApplicationJob
  queue_as :default

  def perform(resource_id, resource_class_name, image_key)
    resource_class = resource_class_name.constantize
    resource = resource_class.find(resource_id)

    return unless resource.images.attached?

    Google::Cloud::Vision.configure do |vision|
      vision.credentials = Rails.application.credentials.dig(:google, :service_key)
    end

    image = resource.images.joins(:blob).find_by(active_storage_blobs: { key: image_key })

    return unless image

    tags = tag_image_with_ai(image)
    colors = ColorMatcherService.detect_colors(image)
    resource.update(tags:, colors:)

    if tags
      matcher = CategoryMatcherService.new(tags)
      matched = matcher.infer_categories
      resource.category = matched[:category] if matched[:category]
      resource.subcategories = matched[:subcategories] if matched[:subcategories]
    end

    if resource.save
      Rails.logger.info("Wardrobe item successfully created for image #{image.id}")
    else
      Rails.logger.error("Failed to create wardrobe item for image #{image.id}: #{wardrobe_item.errors.full_messages}")
    end

    # BulkUploadWardrobeItemsNotifier.with(account:).deliver(resource.owner)
  end

  private

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
end
