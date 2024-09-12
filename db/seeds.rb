# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# Uncomment the following to create an Admin user for Production in Jumpstart Pro
#
#   user = User.create(
#     name: "Admin User",
#     email: "email@example.org",
#     password: "password",
#     password_confirmation: "password",
#     terms_of_service: true
#   )
#   Jumpstart.grant_system_admin!(user)

# Assuming you have an account available for multi-tenancy
account = Account.first

WardrobeItem.create([
  {
    name: "Black Leather Jacket",
    category: "Outerwear",
    color: "Black",
    season: "Fall",
    occasion: "Casual",
    cost: 200.00,
    condition: "Like New",
    account: account
  },
  {
    name: "White Cotton T-Shirt",
    category: "Tops",
    color: "White",
    season: "Summer",
    occasion: "Casual",
    cost: 20.00,
    condition: "Good",
    account: account
  },
  {
    name: "Blue Denim Jeans",
    category: "Bottoms",
    color: "Blue",
    season: "All-Season",
    occasion: "Casual",
    cost: 60.00,
    condition: "Worn",
    account: account
  },
  {
    name: "Red Cocktail Dress",
    category: "Dresses",
    color: "Red",
    season: "Spring",
    occasion: "Evening",
    cost: 150.00,
    condition: "New",
    account: account
  },
  {
    name: "Tan Trench Coat",
    category: "Outerwear",
    color: "Tan",
    season: "Spring",
    occasion: "Work",
    cost: 250.00,
    condition: "Like New",
    account: account
  },
  {
    name: "Black Ankle Boots",
    category: "Shoes",
    color: "Black",
    season: "Fall",
    occasion: "Casual",
    cost: 120.00,
    condition: "Good",
    account: account
  },
  {
    name: "Grey Wool Scarf",
    category: "Accessories",
    color: "Grey",
    season: "Winter",
    occasion: "Casual",
    cost: 35.00,
    condition: "Like New",
    account: account
  },
  {
    name: "Blue Denim Jacket",
    category: "Outerwear",
    color: "Blue",
    season: "Fall",
    occasion: "Casual",
    cost: 80.00,
    condition: "Worn",
    account: account
  },
  {
    name: "Black Silk Blouse",
    category: "Tops",
    color: "Black",
    season: "All-Season",
    occasion: "Work",
    cost: 100.00,
    condition: "Good",
    account: account
  },
  {
    name: "Brown Leather Belt",
    category: "Accessories",
    color: "Brown",
    season: "All-Season",
    occasion: "Casual",
    cost: 40.00,
    condition: "New",
    account: account
  },
  {
    name: "White Sneakers",
    category: "Shoes",
    color: "White",
    season: "Summer",
    occasion: "Casual",
    cost: 75.00,
    condition: "Good",
    account: account
  },
  {
    name: "Floral Maxi Dress",
    category: "Dresses",
    color: "Multicolor",
    season: "Summer",
    occasion: "Casual",
    cost: 90.00,
    condition: "New",
    account: account
  },
  {
    name: "Black Formal Pants",
    category: "Bottoms",
    color: "Black",
    season: "All-Season",
    occasion: "Work",
    cost: 60.00,
    condition: "Like New",
    account: account
  }
])


WishlistItem.create([
  {
    name: "Gucci Leather Tote",
    store: "Gucci",
    price: 1200.00,
    status: "Wishlist",
    savings_goal: 1200.00,
    current_savings: 600.00,
    purchase_date: Date.new(2024, 12, 25),
    account: account,
  },
    {
    name: "Nike Air Max Sneakers",
    store: "Nike",
    price: 150.00,
    status: "In Cart",
    savings_goal: 150.00,
    current_savings: 50.00,
    purchase_date: Date.new(2024, 10, 1),
    account: account
  },
  {
    name: "Chanel Classic Flap Bag",
    store: "Chanel",
    price: 5000.00,
    status: "Wishlist",
    savings_goal: 5000.00,
    current_savings: 1000.00,
    purchase_date: Date.new(2025, 5, 15),
    account: account
  },
  {
    name: "Ray-Ban Aviator Sunglasses",
    store: "Ray-Ban",
    price: 200.00,
    status: "Purchased",
    savings_goal: 200.00,
    current_savings: 200.00,
    purchase_date: Date.new(2024, 6, 15),
    account: account
  },
  {
    name: "Levi's 501 Jeans",
    store: "Levi's",
    price: 80.00,
    status: "In Cart",
    savings_goal: 80.00,
    current_savings: 40.00,
    purchase_date: Date.new(2024, 9, 30),
    account: account
  },
  {
    name: "Apple Watch Series 8",
    store: "Apple",
    price: 400.00,
    status: "Wishlist",
    savings_goal: 400.00,
    current_savings: 100.00,
    purchase_date: Date.new(2024, 11, 15),
    account: account
  },
  {
    name: "Louis Vuitton Wallet",
    store: "Louis Vuitton",
    price: 900.00,
    status: "Wishlist",
    savings_goal: 900.00,
    current_savings: 300.00,
    purchase_date: Date.new(2025, 1, 5),
    account: account
  },
  {
    name: "Adidas UltraBoost",
    store: "Adidas",
    price: 180.00,
    status: "Wishlist",
    savings_goal: 180.00,
    current_savings: 90.00,
    purchase_date: Date.new(2024, 9, 20),
    account: account
  }
])
