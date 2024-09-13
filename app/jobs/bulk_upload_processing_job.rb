# app/jobs/bulk_upload_processing_job.rb
class BulkUploadProcessingJob < ApplicationJob
  queue_as :default

  def perform(resource_id, resource_class_name, image_key)
    # Dynamically fetch the resource by class name
    resource_class = resource_class_name.constantize
    resource = resource_class.find(resource_id)

    image = resource.images.find_by(blob: { key: image_key })

    if image.attached?
      process_image(image)
    end

    Notification.create!(recipient: resource.user, message: "#{resource_class_name} has been processed.")
  end

  def process_image(image)
  end
end

