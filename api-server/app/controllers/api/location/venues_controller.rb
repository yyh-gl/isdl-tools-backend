class Api::Location::VenuesController < ApplicationController
  FOURSQUARE_BASE_URL = 'https://api.foursquare.com/v2/venues/search'.freeze
  FOURSQUARE_GET_LIMIT = 10

  # GET /api/restaurants
  def search
    url = FOURSQUARE_BASE_URL
    url += "?client_id=#{ENV['FOURSQUARE_CLI_ID']}&client_secret=#{ENV['FOURSQUARE_CLI_SECRET']}&v=20180323&limit=#{FOURSQUARE_GET_LIMIT}"
    params.each do |param|
      next if DEFAULT_PARAMS.include?(param)
      url += "&#{param}=#{params[param]}"
    end
    url = URI.escape(url)
    url = URI.parse(url)
    response = Net::HTTP.get_response(url)
    json_response(response.body)
  end

  swagger_controller :Venues, 'スポット検索API（Foursquare）'

  swagger_api :search do
    summary 'Get venues by Foursquare'
    consumes ['application/json']
    param :query, :ll, :integer, :required, 'Latitude and Longitude'
    param :query, :query, :string, :optional, 'Search keyword'
    param :query, :categoryId, :integer, :optional, 'Search category'
    response :ok, 'Success', :Venue
    response :not_found
    response :internal_server_error
  end

  swagger_model :Venue do
    description 'Venue parameters'
    property :venue, :string, :required, '場所に関する情報〜'
  end

  private

  def to_hash(str)
    str.scan(/(\w+):\s+(\d+)/).map{|k, v| [k.to_sym, v.to_i] }.to_h
  end

end
