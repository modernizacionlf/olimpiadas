require "test_helper"

class CulturalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cultural_index_url
    assert_response :success
  end

  test "should get view" do
    get cultural_view_url
    assert_response :success
  end
end
