require 'test_helper'

class FollowTimelinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get follow_timelines_show_url
    assert_response :success
  end

end
