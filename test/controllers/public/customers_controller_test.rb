require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get unsubscribe" do
    get public_customers_unsubscribe_url
    assert_response :success
  end
end
