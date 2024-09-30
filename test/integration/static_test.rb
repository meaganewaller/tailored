require "test_helper"

class Jumpstart::StaticTest < ActionDispatch::IntegrationTest
  test "homepage" do
    get root_path
    assert_response :success
  end

  test "dashboard" do
    user = users(:one)
    sign_in user
    get root_path
    assert_select "h1", I18n.translate("dashboard.show.title", name: user.name)
  end
end
