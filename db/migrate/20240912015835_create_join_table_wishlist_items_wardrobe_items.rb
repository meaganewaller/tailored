class CreateJoinTableWishlistItemsWardrobeItems < ActiveRecord::Migration[7.2]
  def change
    create_join_table :wishlist_items, :wardrobe_items do |t|
      t.index :wishlist_item_id
      t.index :wardrobe_item_id
    end
  end
end
