require "application_system_test_case"

class OutfitsTest < ApplicationSystemTestCase
  setup do
    @outfit = outfits(:one)
  end

  test "visiting the index" do
    visit outfits_url
    assert_selector "h1", text: "Outfits"
  end

  test "should create outfit" do
    visit outfits_url
    click_on "New outfit"

    fill_in "Account", with: @outfit.account_id
    fill_in "Name", with: @outfit.name
    fill_in "Occasion", with: @outfit.occasion
    fill_in "Rating", with: @outfit.rating
    fill_in "Season", with: @outfit.season
    click_on "Create Outfit"

    assert_text "Outfit was successfully created"
    click_on "Back"
  end

  test "should update Outfit" do
    visit outfit_url(@outfit)
    click_on "Edit this outfit", match: :first

    fill_in "Account", with: @outfit.account_id
    fill_in "Name", with: @outfit.name
    fill_in "Occasion", with: @outfit.occasion
    fill_in "Rating", with: @outfit.rating
    fill_in "Season", with: @outfit.season
    click_on "Update Outfit"

    assert_text "Outfit was successfully updated"
    click_on "Back"
  end

  test "should destroy Outfit" do
    visit outfit_url(@outfit)
    click_on "Destroy this outfit", match: :first

    assert_text "Outfit was successfully destroyed"
  end
end
