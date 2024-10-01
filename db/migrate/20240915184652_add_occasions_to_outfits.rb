class AddOccasionsToOutfits < ActiveRecord::Migration[7.2]
  def change
    add_column :outfits, :occasions, :string, array: true, default: []
  end
end
