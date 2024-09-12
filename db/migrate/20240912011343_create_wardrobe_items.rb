class CreateWardrobeItems < ActiveRecord::Migration[7.2]
  def change
    create_table :wardrobe_items do |t|
      t.string :name
      t.string :category
      t.string :color
      t.string :season
      t.string :occasion
      t.decimal :cost
      t.string :condition
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
