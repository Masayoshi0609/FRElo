require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homes_index_url
    assert_response :success
  end

  test "should get type" do
    get homes_type_url
    assert_response :success
  end

  test "should get welcome" do
    get homes_welcome_url
    assert_response :success
  end

end
