class AddCategoryToWardrobeItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :wardrobe_items, :category, foreign_key: true
    create_join_table :wardrobe_items, :categories, table_name: :wardrobe_item_subcategories do |t|
      t.index :wardrobe_item_id
      t.index :category_id
      t.foreign_key :wardrobe_items
      t.foreign_key :categories
    end
  end
end
