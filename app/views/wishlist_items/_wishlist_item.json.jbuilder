json.extract! wishlist_item, :id, :name, :store, :price, :status, :savings_goal, :current_savings, :purchase_date, :account_id, :created_at, :updated_at
json.url wishlist_item_url(wishlist_item, format: :json)
