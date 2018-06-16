class Api::MusicsController < ApplicationController
  # GET /api/musics
  def index
    musics = Music.all
    json_response(musics)
  end

  # POST /api/musics
  def create
    music = Music.create!(name: params[:name], artist: params[:artist], path: params[:path])
    json_response(music)
  end

  # GET /api/musics/:id
  def show
    music = Music.find(params[:id])
    json_response(music)
  end

  # GET /api/musics/uploaded/user/:id
  def get_uploaded
    user = User.find(params[:id])
    musics = user.musics
    json_response(musics)
  end

  # GET /api/musics/possessed/user/:id
  def get_possessed
    user = User.find(params[:id])
    musics = user.user_musics.music
    json_response(musics)
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

  swagger_api :get_uploaded do
    summary 'ユーザがアップロードした曲一覧取得'
    consumes ['application/json']
    param :path, :id, :integer, :required, 'User id'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_api :get_possessed do
    summary 'ユーザが所持している曲一覧取得'
    consumes ['application/json']
    param :path, :id, :integer, :required, 'User id'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_model :Music do
    description 'Music parameters'
    property :id, :integer, :required, 1
  end
end
