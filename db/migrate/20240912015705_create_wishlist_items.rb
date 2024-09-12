class CreateWishlistItems < ActiveRecord::Migration[7.2]
  def change
    create_table :wishlist_items do |t|
      t.string :name
      t.string :store
      t.decimal :price
      t.string :status
      t.decimal :savings_goal
      t.decimal :current_savings
      t.date :purchase_date
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
