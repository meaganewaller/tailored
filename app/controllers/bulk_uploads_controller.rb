class BulkUploadsController < ApplicationController
  before_action :set_resource_class

  def new
  end

  def create
    if params[:images].present?
      params[:images].each do |image|
        next if image.blank?

        resource_item = @resource_class.new
        resource_item.images.attach(image) if resource_item.respond_to?(:images)

        if resource_item.save
          resource_item.images.each do |attached_image|
            BulkUploadProcessingJob.perform_later(resource_item.id, @resource_class.to_s, attached_image.key)
          end
        else
          flash[:alert] ||= "Some items could not be uploaded."
        end
      end
      flash[:notice] ||= "Your wardrobe items are being processed."
    else
      flash[:alert] = "Please upload at least one image."
    end

    flash[:notice] = "Your #{resource_name.pluralize} are being processed. You will be notified when complete."
    redirect_to root_path # Adjust redirection as needed
  end

  private

  def set_resource_class
    # Determine the resource class dynamically from the resource_type parameter
    @resource_class = case params[:resource_type]
    when 'wardrobe_item'
      WardrobeItem
    # when 'outfit'
    #   Outfit
    else
      raise 'Unknown resource type'
    end
  end

  def resource_name
    @resource_class.model_name.human.downcase
  end
end
