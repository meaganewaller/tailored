class CreateOutfitsWishlistItemsJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :outfits, :wishlist_items do |t|
      t.index :outfit_id
      t.index :wishlist_item_id
    end
  end
end
