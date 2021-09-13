require 'test_helper'

class BuddyTimelinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get buddy_timelines_show_url
    assert_response :success
  end

end
