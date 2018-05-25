class Api::UsersController < ApplicationController

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
