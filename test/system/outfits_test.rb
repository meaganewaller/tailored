require "application_system_test_case"

class OutfitsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @outfit = outfits(:one)
    login_as @user, scope: :user
  end

  test "visiting the index" do
    visit outfits_url
    assert_selector "h1", text: "Outfits"
  end

  test "should create outfit" do
    visit outfits_url
    click_on "New Outfit"

    fill_in "Name", with: @outfit.name
    find(:select, "Occasion").select(@outfit.occasion)
    fill_in "Rating", with: @outfit.rating
    find(:select, "Season").select(@outfit.season)
    click_on "Create Outfit"

    assert_text "Outfit was successfully created"
  end

  test "should update outfit" do
    visit outfit_url(@outfit)
    click_on "Edit this outfit", match: :first

    fill_in "Name", with: @outfit.name
    find(:select, "Occasion").select(@outfit.occasion)
    fill_in "Rating", with: @outfit.rating
    find(:select, "Season").select(@outfit.season)
    click_on "Update Outfit"

    assert_text "Outfit was successfully updated"
  end

  test "should destroy outfit" do
    visit outfit_url(@outfit)
    click_on "Destroy this outfit", match: :first
    click_on "Confirm", match: :first

    assert_text "Outfit was successfully destroyed"
  end
end
