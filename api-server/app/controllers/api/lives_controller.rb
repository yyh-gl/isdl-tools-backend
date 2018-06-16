class Api::LivesController < ApplicationController
  # GET /api/lives
  def index
    lives = Live.all
    json_response(lives)
  end

  # POST /api/lives
  def create
    live = Live.create!(user_id: params[:id], name: 'みんな集まれ〜', date: DateTime.now.tomorrow)
    json_response(live)
  end

  # GET /api/lives/:live_id
  def show
    live = Live.find(params[:live_id])
    json_response(live)
  end

  # POST /api/lives/like/:live_id
  def like
    live = Live.find(params[:live_id])
    like_count = live.like + 1
    live.update(like: like_count)
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
    param :query, :id, :integer, :required, 'User id'
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

  swagger_api :like do
    summary 'いいね'
    consumes ['application/json']
    param :path, :live_id, :integer, :required, 'Live Id'
    response :ok, 'Success', :Live
    response :not_found
    response :internal_server_error
  end

  swagger_model :Live do
    description 'User parameters'
    property :id, :integer, :required, 1
  end
end
