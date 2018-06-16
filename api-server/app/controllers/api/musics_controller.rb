class Api::MusicsController < ApplicationController
  # GET /api/music
  def index
    music = Music.all
    json_response(music)
  end

  # POST /api/music
  def create
    music = Music.create!(name: params[:name], artist: params[:artist], path: params[:path])
    json_response(music)
  end

  # GET /api/music/:id
  def show
    music = Music.find(params[:id])
    json_response(music)
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
    property :id, :integer, :required, 1
  end
end
