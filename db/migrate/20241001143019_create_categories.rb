class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.references :account, foreign_key: true
      t.references :parent, foreign_key: {to_table: :categories}
      t.string :name, null: false
      t.boolean :global, default: false, null: false

      t.timestamps
    end

    add_index :categories, [:account_id, :name], unique: true
  end
end
