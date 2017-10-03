require 'test_helper'

class PassengerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passenger_index_url
    assert_response :success
  end

  test "should get new" do
    get passenger_new_url
    assert_response :success
  end

  test "should get show" do
    get passenger_show_url
    assert_response :success
  end

  test "should get edit" do
    get passenger_edit_url
    assert_response :success
  end

  test "should get update" do
    get passenger_update_url
    assert_response :success
  end

  test "should get create" do
    get passenger_create_url
    assert_response :success
  end

  test "should get destroy" do
    get passenger_destroy_url
    assert_response :success
  end

end
