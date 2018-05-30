class Api::RestaurantsController < ApplicationController
  require 'open-uri'

  BASE_URL = "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=#{ENV['KEY_ID']}".freeze
  DEFAULT_PARAMS = ['controller', 'action'].freeze

  # GET /api/restaurants
  def search
    url = BASE_URL
    params.each do |param|
      next if DEFAULT_PARAMS.include?(param)
      url += "&#{param}=#{params[param]}"
    end
    url_escape = URI.escape(url)
    response = open(url_escape)
    json_response(response)
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
