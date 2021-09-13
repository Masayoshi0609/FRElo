require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get users_confirm_url
    assert_response :success
  end

  test "should get quit" do
    get users_quit_url
    assert_response :success
  end

end
