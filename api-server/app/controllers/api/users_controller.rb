class Api::UsersController < ApplicationController

  # GET /api/user
  def index
    users = User.all
    json_response(users)
  end

end
