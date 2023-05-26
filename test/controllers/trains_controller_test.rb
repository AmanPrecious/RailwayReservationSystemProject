require "test_helper"

class TrainsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get trains_show_url
    assert_response :success
  end
end
