require "test_helper"

class GalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gallery_index_url
    assert_response :success
  end

  test "should get new" do
    get gallery_new_url
    assert_response :success
  end

  test "should get create" do
    get gallery_create_url
    assert_response :success
  end
end
