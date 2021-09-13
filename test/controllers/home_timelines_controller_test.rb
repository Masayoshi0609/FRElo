require 'test_helper'

class HomeTimelinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get home_timelines_show_url
    assert_response :success
  end

end
