require "test_helper"

class CulturalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cultural_index_url
    assert_response :success
  end

  test "should get show" do
    get cultural_show_url
    assert_response :success
  end
end
