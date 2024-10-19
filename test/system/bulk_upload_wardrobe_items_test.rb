require "application_system_test_case"

class BulkUploadWardrobeItemsTets < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    login_as @user, scope: :user
  end

  test "visiting the BulkUploads for wardrobe items page" do
    visit bulk_upload_wardrobe_items_url
    assert_selector "h1", text: "Upload New Wardrobe items"
  end

  test "should preview images before submission" do
    visit bulk_upload_wardrobe_items_url

    attach_file "images[]", [file_fixture("avatar.jpg"), file_fixture("test_image.jpg"), file_fixture("test_image_2.jpg")]
    click_button I18n.t("submit")
    assert_selector "img[src*='avatar.jpg']"
    assert_selector "img[src*='test_image.jpg']"
    assert_selector "img[src*='test_image_2.jpg']"
  end
end
