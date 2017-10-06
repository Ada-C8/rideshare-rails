require 'test_helper'

class RideshareControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rideshare_index_url
    assert_response :success
  end

end
