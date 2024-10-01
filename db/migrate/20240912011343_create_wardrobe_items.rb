class CreateWardrobeItems < ActiveRecord::Migration[7.2]
  def change
    create_table :wardrobe_items do |t|
      t.string :name
      t.jsonb :colors, null: false, default: []
      t.jsonb :tags, null: false, default: []
      t.string :season
      t.string :occasions, array: true, default: []
      t.decimal :cost
      t.string :condition
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
