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

  # GET /api/musics/cross/:user_id
  # user_cross_musicに登録されてる曲一覧の取得
  def get_received_cross_music
    cross_musics = UserCrossMusic.where(user_id: params[:user_id])
    musics = []
    cross_musics.each do |cross_music|
      musics << {
        id: cross_music.music[:id],
        name: cross_music.music[:name],
        artist: cross_music.music[:artist],
        user_cross_music_id: cross_music[:id]
      }
    end
    json_response(musics)
  end

  # POST /api/musics/cross
  # 受信した曲をすれちがい通信で取得したリストに保存
  #   sender：曲を送る側
  #   receiver：曲を受け取る側
  def save_received_cross_music!
    # 送信者側のすれちがい通信許可曲を追加
    send_user = User.find(params[:sender_id])
    new_cross_musics = send_user.user_musics
    new_cross_musics.each do |cross_music|
      music = Music.find(cross_music[:music_id])
      if music['cross']
        UserCrossMusic.create!(user_id: params[:reciever_id], music_id: cross_music[:music_id])
      end
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
    summary '曲のマスタ情報一覧を取得'
    consumes ['application/json']
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_api :create do
    summary '曲のマスタ情報を作成（アーティストによるアップロード）'
    consumes ['application/json']
    param :query, :name, :string, :required, 'Music name'
    param :query, :artist, :string, :required, 'Artist name'
    param :query, :path, :string, :required, 'Path to music'
    response :ok, 'Success', :Music
    response :internal_server_error
  end

  swagger_api :show do
    summary '曲のマスタ情報を1件取得'
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
    summary 'ユーザがローカルに所持している曲一覧取得'
    consumes ['application/json']
    param :path, :user_id, :integer, :required, 'User id'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_api :get_received_cross_music do
    summary 'すれ違い通信で受信した曲（未DLのもの）一覧取得'
    consumes ['application/json']
    param :path, :user_id, :integer, :required, 'User id'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_api :save_received_cross_music! do
    summary 'すれちがい通信時に使うやつ（送信者の配信曲リストを受信者のDBに保存する）'
    consumes ['application/json']
    param :query, :sender_id, :integer, :required, '曲を送る側のid'
    param :query, :receiver_id, :integer, :required, '曲を受信する側のid'
    response :ok, 'Success', :Music
    response :not_found
    response :internal_server_error
  end

  swagger_api :delete_received_cross_music do
    summary 'すれちがい通信で受信した曲をDBから削除'
    consumes ['application/json']
    response :ok, 'Success', :Music
    param :query, :user_cross_music_id, :integer, :required, '削除対象の曲id'
    response :not_found
    response :internal_server_error
  end

  swagger_api :accept_received_cross_music do
    summary 'すれちがい通信で受信した曲をローカルに保存'
    consumes ['application/json']
    response :ok, 'Success', :Music
    param :query, :user_id, :integer, :required, 'User id'
    param :query, :user_cross_music_id, :integer, :required, '保存対象の曲id'
    response :not_found
    response :internal_server_error
  end

  swagger_model :Music do
    description 'Music parameters'
    property :id, :integer, :required, 1
  end

end