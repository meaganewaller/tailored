require "test_helper"

class BulkUploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "get a bulk uploads page success" do
    get new_bulk_upload_url
    assert_response :success
  end
end
