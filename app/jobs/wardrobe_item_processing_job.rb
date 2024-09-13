class WardrobeItemProcessingJob < ApplicationJob
  queue_as :default

  def perform(wardrobe_item_id)
    wardrobe_item = WardrobeItem.find(wardrobe_item_id)

    wardrobe_item.update(name: "Wardrobe Item #{wardrobe_item_id}")

    # vision = Google::Cloud::Vision.image_annotator
    # response = vision.label_detection(image: wardrobe_item.image.download)

    # tags = response.label_annotations.map(&:description)

    # wardrobe_item.update(tags: tags)

    Notification.create(recipient: wardrobe_item.user, message: "#{wardrobe_item.name || 'An item'} has been processed and added to your wardrobe.")
  rescue => e
    # Handle errors (log them, notify the user, etc.)
    Notification.create(recipient: wardrobe_item.user, message: "There was an issue processing #{wardrobe_item.name || 'an item'}. Please try again.")
  end
end
