require 'test_helper'

class HotTimelinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hot_timelines_show_url
    assert_response :success
  end

end
