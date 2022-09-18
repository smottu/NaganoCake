require "test_helper"

class Public::InformationControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_information_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_information_update_url
    assert_response :success
  end
end
