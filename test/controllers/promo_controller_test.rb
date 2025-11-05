require "test_helper"

class PromoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get promo_index_url
    assert_response :success
  end

  test "should get show" do
    get promo_show_url
    assert_response :success
  end
end
