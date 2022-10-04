require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get cars_login_url
    assert_response :success
  end
end
