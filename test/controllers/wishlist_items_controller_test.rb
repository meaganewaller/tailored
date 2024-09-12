require "test_helper"

class WishlistItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @wishlist_item = wishlist_items(:one)
  end

  test "should get index" do
    get wishlist_items_url
    assert_response :success
  end

  test "should get new" do
    get new_wishlist_item_url
    assert_response :success
  end

  test "should create wishlist_item" do
    assert_difference("WishlistItem.count") do
      post wishlist_items_url, params: {wishlist_item: {account_id: @wishlist_item.account_id, current_savings: @wishlist_item.current_savings, name: @wishlist_item.name, price: @wishlist_item.price, purchase_date: @wishlist_item.purchase_date, savings_goal: @wishlist_item.savings_goal, status: @wishlist_item.status, store: @wishlist_item.store}}
    end

    assert_redirected_to wishlist_item_url(WishlistItem.last)
  end

  test "should show wishlist_item" do
    get wishlist_item_url(@wishlist_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_wishlist_item_url(@wishlist_item)
    assert_response :success
  end

  test "should update wishlist_item" do
    patch wishlist_item_url(@wishlist_item), params: {wishlist_item: {account_id: @wishlist_item.account_id, current_savings: @wishlist_item.current_savings, name: @wishlist_item.name, price: @wishlist_item.price, purchase_date: @wishlist_item.purchase_date, savings_goal: @wishlist_item.savings_goal, status: @wishlist_item.status, store: @wishlist_item.store}}
    assert_redirected_to wishlist_item_url(@wishlist_item)
  end

  test "should destroy wishlist_item" do
    assert_difference("WishlistItem.count", -1) do
      delete wishlist_item_url(@wishlist_item)
    end

    assert_redirected_to wishlist_items_url
  end
end
