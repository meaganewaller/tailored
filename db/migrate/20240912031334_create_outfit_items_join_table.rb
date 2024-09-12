class CreateOutfitItemsJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :outfits, :wardrobe_items do |t|
      t.index :outfit_id
      t.index :wardrobe_item_id
    end
  end
end
