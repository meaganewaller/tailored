class CategoryInferenceService
  def self.infer_category(wardrobe_item_id, user_id)
    user = User.find(user_id)
    wardrobe_item = user.wardrobe_items.find(wardrobe_item_id)

    return unless wardrobe_item

    WARDROBE_ITEMS_CATEGORIES.keys do |category|
      wardrobe_item.tags.each do |tag|
        return category.capitalize if category.include?(tag.downcase)
      end
    end
    "Unknown"
  end

  def self.infer_sub_category(wardrobe_item_id, user_id)
    wardrobe_item = WardrobeItem.find_by(id: wardrobe_item_id, user_id:)
    if WARDROBE_ITEMS_CATEGORIES[wardrobe_item.category.downcase]
      WARDROBE_ITEMS_CATEGORIES[wardrobe_item.category.downcase].each do |term|
        tags.each do |tag|
        return sub_categories
        end
      end
    end
    WARDROBE_ITEMS_CATEGORIES.values do |terms|
      terms.each do |term|
        return 
      end
    end
  end
end
