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

  # GET /api/musics/:user_id
  def show
    music = Music.find(params[:user_id])
    json_response(music)
  end

  # GET /api/musics/uploaded/user/:id
  def get_uploaded
    user = User.find(params[:user_id])
    musics = user.musics
    json_response(musics)
  end

  # GET /api/musics/possessed/user/:id
  def get_possessed
    user = User.find(params[:user_id])
    musics = user.user_musics

    possessed_musics = []
    musics.each do |music|
      possessed_musics << Music.find(music[:music_id])
    end
    json_response(possessed_musics)
  end

  # GET /api/musics/cross
  # user_cross_musicに登録されてる曲一覧の取得
  def get_received_cross_music
    cross_musics = UserCrossMusic.where(user_id: params[:user_id])
    json_response(cross_musics)
  end

  # POST /api/musics/cross
  # 受信した曲をすれちがい通信で取得したリストに保存
  #   sender：曲を送る側
  #   receiver：曲を受け取る側
  def save_received_cross_music!
    # 送信者側のすれちがい通信許可曲を追加
    send_user = User.find(params[:sender_id])
    new_cross_musics = send_user.user_cross_musics
    new_cross_musics.each do |music|
      UserCrossMusic.create!(user_id: params[:receiver_id], music_id: music[:music_id])
    end
    json_response(new_cross_musics)
  end

  # DELETE /api/musics/cross/:user_cross_music_id
  # user_cross_musicに登録されてる曲を削除
  def delete_received_cross_music
    cross_music = UserCrossMusic.find(params[:user_cross_music_id])
    cross_music.delete
    json_response(cross_music)
  end

  # POST /api/musics/cross/user
  # user_cross_musicに登録されてる曲をuser_musicに保存
  def accept_received_cross_music
    cross_music = UserCrossMusic.find(params[:user_cross_music_id])
    music = cross_music.music
    UserMusic.create!(user_id: params[:user_id], music_id: music[:id], local_path: '/')
    cross_music.delete
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
    param :path, :user_id, :integer, :required, 'Music Id'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_api :get_uploaded do
    summary 'ユーザがアップロードした曲一覧取得'
    consumes ['application/json']
    param :path, :user_id, :integer, :required, 'User id'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_api :get_possessed do
    summary 'ユーザが所持している曲一覧取得'
    consumes ['application/json']
    param :path, :user_id, :integer, :required, 'User id'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_model :Music do
    description 'Music parameters'
    property :id, :integer, :required, 1
  end

end