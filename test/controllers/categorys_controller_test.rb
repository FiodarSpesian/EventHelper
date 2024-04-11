require "test_helper"

class CategorysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get categorys_new_url
    assert_response :success
  end

  test "should get show" do
    get categorys_show_url
    assert_response :success
  end

  test "should get create" do
    get categorys_create_url
    assert_response :success
  end

  test "should get edit" do
    get categorys_edit_url
    assert_response :success
  end

  test "should get update" do
    get categorys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get categorys_destroy_url
    assert_response :success
  end
end
