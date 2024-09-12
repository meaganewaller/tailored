require "application_system_test_case"

class WishlistItemsTest < ApplicationSystemTestCase
  setup do
    @wishlist_item = wishlist_items(:one)
  end

  test "visiting the index" do
    visit wishlist_items_url
    assert_selector "h1", text: "Wishlist items"
  end

  test "should create wishlist item" do
    visit wishlist_items_url
    click_on "New wishlist item"

    fill_in "Account", with: @wishlist_item.account_id
    fill_in "Current savings", with: @wishlist_item.current_savings
    fill_in "Name", with: @wishlist_item.name
    fill_in "Price", with: @wishlist_item.price
    fill_in "Purchase date", with: @wishlist_item.purchase_date
    fill_in "Savings goal", with: @wishlist_item.savings_goal
    fill_in "Status", with: @wishlist_item.status
    fill_in "Store", with: @wishlist_item.store
    click_on "Create Wishlist item"

    assert_text "Wishlist item was successfully created"
    click_on "Back"
  end

  test "should update Wishlist item" do
    visit wishlist_item_url(@wishlist_item)
    click_on "Edit this wishlist item", match: :first

    fill_in "Account", with: @wishlist_item.account_id
    fill_in "Current savings", with: @wishlist_item.current_savings
    fill_in "Name", with: @wishlist_item.name
    fill_in "Price", with: @wishlist_item.price
    fill_in "Purchase date", with: @wishlist_item.purchase_date
    fill_in "Savings goal", with: @wishlist_item.savings_goal
    fill_in "Status", with: @wishlist_item.status
    fill_in "Store", with: @wishlist_item.store
    click_on "Update Wishlist item"

    assert_text "Wishlist item was successfully updated"
    click_on "Back"
  end

  test "should destroy Wishlist item" do
    visit wishlist_item_url(@wishlist_item)
    click_on "Destroy this wishlist item", match: :first

    assert_text "Wishlist item was successfully destroyed"
  end
end
