class AddCategoryToOutfits < ActiveRecord::Migration[7.2]
  def change
    add_column :outfits, :category, :string
  end
end
