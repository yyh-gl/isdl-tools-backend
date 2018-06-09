class Api::Location::RestaurantsController < ApplicationController
  GURUNAVI_BASE_URL = "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=#{ENV['GURUNAVI_KEY_ID']}&format=json".freeze

  # GET /api/restaurants
  def search
    url = GURUNAVI_BASE_URL
    params.each do |param|
      next if DEFAULT_PARAMS.include?(param)
      url += "&#{param}=#{params[param]}"
    end
    url = URI.escape(url)
    url = URI.parse(url)
    response = Net::HTTP.get_response(url)
    json_response(response.body)
  end

  swagger_controller :Restaurants, 'レストラン検索API（ぐるなび）'

  swagger_api :search do
    summary 'Get restaurants by Gurunavi'
    consumes ['application/json']
    param :query, :name, :string, :optional, 'Restaurant name'
    param :query, :address, :string, :optional, 'Restaurant address'
    param :query, :latitude, :integer, :optional, 'Restaurant latitude'
    param :query, :longitude, :integer, :optional, 'Restaurant longitude'
    response :ok, 'Success', :Restaurant
    response :not_found
    response :internal_server_error
  end

end
