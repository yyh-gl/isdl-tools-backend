class Api::MusicsController < ApplicationController
  # GET /api/music
  def index
    users = Music.all
    json_response(users)
  end

  # POST /api/music
  def create
    user = Music.create!(name: params[:name], artist: params[:artist])
    json_response(user)
  end

  # GET /api/music/:id
  def show
    user = Music.find(params[:id])
    json_response(user)
  end
end
