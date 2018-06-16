class Api::LivesController < ApplicationController
  # GET /api/users
  def index
    lives = Live.all
    json_response(lives)
  end

  # POST /api/users
  def create
    live = Live.create!(user_id: params[:id], name: 'みんな集まれ〜', date: DateTime.now.tomorrow)
    json_response(live)
  end

  # GET /api/users/:id
  def show
    live = Live.find_by(user_id: params[:id])
    json_response(live)
  end

  swagger_controller :Lives, 'ライブAPI'

  swagger_api :index do
    summary 'Get all lives information'
    consumes ['application/json']
    response :ok, 'Success', :Live
    response :not_found
    response :internal_server_error
  end

  swagger_api :create do
    summary 'Add new live information'
    consumes ['application/json']
    param :query, :user_id, :integer, :required, 'User id'
    response :ok, 'Success', :Live
    response :internal_server_error
  end

  swagger_api :show do
    summary 'Get a live information'
    consumes ['application/json']
    param :path, :id, :integer, :required, 'User Id'
    response :ok, 'Success', :Live
    response :not_found
    response :internal_server_error
  end

  swagger_model :Live do
    description 'User parameters'
    property :id, :integer, :required, 1
  end
end
