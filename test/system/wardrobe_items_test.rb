require "application_system_test_case"

class WardrobeItemsTest < ApplicationSystemTestCase
  setup do
    @wardrobe_item = wardrobe_items(:one)
  end

  test "visiting the index" do
    visit wardrobe_items_url
    assert_selector "h1", text: "Wardrobe items"
  end

  test "should create wardrobe item" do
    visit wardrobe_items_url
    click_on "New wardrobe item"

    fill_in "Account", with: @wardrobe_item.account_id
    fill_in "Category", with: @wardrobe_item.category
    fill_in "Color", with: @wardrobe_item.color
    fill_in "Condition", with: @wardrobe_item.condition
    fill_in "Cost", with: @wardrobe_item.cost
    fill_in "Name", with: @wardrobe_item.name
    fill_in "Occasion", with: @wardrobe_item.occasion
    fill_in "Season", with: @wardrobe_item.season
    click_on "Create Wardrobe item"

    assert_text "Wardrobe item was successfully created"
    click_on "Back"
  end

  test "should update Wardrobe item" do
    visit wardrobe_item_url(@wardrobe_item)
    click_on "Edit this wardrobe item", match: :first

    fill_in "Account", with: @wardrobe_item.account_id
    fill_in "Category", with: @wardrobe_item.category
    fill_in "Color", with: @wardrobe_item.color
    fill_in "Condition", with: @wardrobe_item.condition
    fill_in "Cost", with: @wardrobe_item.cost
    fill_in "Name", with: @wardrobe_item.name
    fill_in "Occasion", with: @wardrobe_item.occasion
    fill_in "Season", with: @wardrobe_item.season
    click_on "Update Wardrobe item"

    assert_text "Wardrobe item was successfully updated"
    click_on "Back"
  end

  test "should destroy Wardrobe item" do
    visit wardrobe_item_url(@wardrobe_item)
    click_on "Destroy this wardrobe item", match: :first

    assert_text "Wardrobe item was successfully destroyed"
  end
end
