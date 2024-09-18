class AddOccasionsToOutfits < ActiveRecord::Migration[7.2]
  def change
    add_column :outfits, :occasions, :string, array: true, default: []
    add_column :outfits, :subcategories, :jsonb, null: false, default: []
  end
end
