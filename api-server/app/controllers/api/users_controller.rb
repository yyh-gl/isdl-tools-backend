class Api::UsersController < ApplicationController

  swagger_controller :Users, 'ユーザAPI'

  swagger_api :index do
    summary 'All users information'
    consumes ['application/json']
    response :ok, 'Success', :User
    response :not_found
    response :internal_server_error
  end

  swagger_api :show do
    summary 'a user information'
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
    property :age, :integer, :required, 20
    property :message, :string, :required, 'Hello World!'
    property :created_at, :string, :required, '2018-05-26T01:03:21.550+09:00'
    property :updated_at, :string, :required, '2018-05-26T01:03:21.550+09:00'
  end

  # GET /api/user
  def index
    users = User.all
    json_response(users)
  end

  # GET /api/user/:id
  def show
    user = User.find(params[:id])
    json_response(user)
  end

end
