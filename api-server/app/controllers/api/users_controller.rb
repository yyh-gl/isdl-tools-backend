class Api::UsersController < ApplicationController

  # GET /api/user
  def index
    users = User.all
    json_response(users)
  end

  # POST /api/user/
  def create
    user = User.create!(name: params['name'], age: params['age'], message: params['message'])
    json_response(user)
  end

  # GET /api/user/:id
  def show
    user = User.find(params[:id])
    json_response(user)
  end

  swagger_controller :Users, 'ユーザAPI'

  swagger_api :index do
    summary 'Get all users information'
    consumes ['application/json']
    response :ok, 'Success', :User
    response :not_found
    response :internal_server_error
  end

  swagger_api :create do
    summary 'Add new user information'
    consumes ['application/json']
    param :query, :name, :string, :required, 'User name'
    param :query, :age, :integer, :required, 'User age'
    param :query, :message, :string, :required, 'User message'
    response :ok, 'Success', :User
    response :internal_server_error
  end

  swagger_api :show do
    summary 'Get a user information'
    consumes ['application/json']
    param :path, :id, :integer, :required, 'User Id'
    response :ok, 'Success', :User
    response :not_found
    response :internal_server_error
  end

  swagger_model :User do
    description 'User parameters'
    property :id, :integer, :required, 1
    property :name, :string, :required, 'テスト 太郎'
    property :age, :integer, :optional, 20
    property :message, :string, :optional, 'Hello World!'
    property :created_at, :string, :required, '2018-05-26T01:03:21.550+09:00'
    property :updated_at, :string, :required, '2018-05-26T01:03:21.550+09:00'
  end

end
