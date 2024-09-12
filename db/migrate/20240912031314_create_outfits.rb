class CreateOutfits < ActiveRecord::Migration[7.2]
  def change
    create_table :outfits do |t|
      t.string :name
      t.string :occasion
      t.string :season
      t.integer :rating
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
