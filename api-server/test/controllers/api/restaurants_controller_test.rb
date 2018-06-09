require 'test_helper'

class Api::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get search_with_storename" do
    get api_restaurants_search_with_storename_url
    assert_response :success
  end

  test "should get search_with_address" do
    get api_restaurants_search_with_address_url
    assert_response :success
  end

  test "should get search_with_latlon" do
    get api_restaurants_search_with_latlon_url
    assert_response :success
  end

end
