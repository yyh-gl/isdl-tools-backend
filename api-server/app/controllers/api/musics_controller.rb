class Api::MusicsController < ApplicationController
  # GET /api/music
  def index
    Musics = Music.all
    json_response(Musics)
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

  swagger_controller :Musics, 'Music API'

  swagger_api :index do
    summary 'Get all Musics information'
    consumes ['application/json']
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_api :create do
    summary 'Add new Music information'
    consumes ['application/json']
    param :query, :name, :string, :required, 'Music name'
    param :query, :artist, :string, :required, 'Artist name'
    param :query, :path, :string, :required, 'Path to music'
    response :ok, 'Success', :Music
    response :internal_server_error
  end

  swagger_api :show do
    summary 'Get a Music information'
    consumes ['application/json']
    param :path, :id, :integer, :required, 'Music Id'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_model :Music do
    description 'Music parameters'
  end
end
