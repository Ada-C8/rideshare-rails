require 'test_helper'

class PassengersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passengers_index_url
    assert_response :success
  end

end
