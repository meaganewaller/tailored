class BulkUploadsController < ApplicationController
  before_action :set_resource_class

  def new
    @resource_item = @resource_class.new
  end

  def create
    blanks_removed = params[:images].reject { |img| img.blank? }
    unless blanks_removed.present?
      flash.now[:alert] = "Please upload at least one image."
      render :new and return
    end

    errors = []

    blanks_removed.each do |image|
      next if image.blank?

      resource_item = @resource_class.new
      resource_item.images.attach(image) if resource_item.respond_to?(:images)

      unless resource_item.save
        errors << "Some items could not be uploaded."
        next
      end

      resource_item.images.each do |attached_image|
        BulkUploadProcessingJob.perform_later(resource_item.id, @resource_class.to_s, attached_image.key)
      end
    end

    if errors.any?
      flash.now[:alert] = errors.join(", ")
      render :new
    else
      flash[:notice] = "Your #{resource_name.pluralize} are being processed. You will be notified when complete."
      redirect_to wardrobe_items_path
    end
  end

  private

  def set_resource_class
    # Determine the resource class dynamically from the resource_type parameter
    @resource_class = case params[:resource_type]
    when "wardrobe_item"
      WardrobeItem
    else
      raise "Unknown resource type"
    end
  end

  def resource_name
    @resource_class.model_name.human.downcase
  end
end
