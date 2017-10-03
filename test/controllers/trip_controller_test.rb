require 'test_helper'

class TripControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get trip_show_url
    assert_response :success
  end

end
