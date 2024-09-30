require "application_system_test_case"

class WardrobeItemsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @wardrobe_item = wardrobe_items(:one)
    login_as @user, scope: :user
  end

  test "visiting the index" do
    visit wardrobe_items_url
    assert_selector "h1", text: "Wardrobe Items"
  end

  test "should create wardrobe item" do
    visit wardrobe_items_url
    click_on "New Wardrobe Item"

    fill_in "Name", with: @wardrobe_item.name
    click_on "Create Wardrobe item"

    assert_text "Wardrobe item was successfully created"
  end

  test "should update Wardrobe item" do
    visit wardrobe_item_url(@wardrobe_item)
    click_on "Edit", match: :first

    fill_in "Name", with: @wardrobe_item.name
    click_on "Update Wardrobe item"

    assert_text "Wardrobe item was successfully updated"
  end

  test "should destroy Wardrobe item" do
    visit wardrobe_item_url(@wardrobe_item)
    click_on "Delete", match: :first

    assert_text "Wardrobe item was successfully destroyed"
  end
end
