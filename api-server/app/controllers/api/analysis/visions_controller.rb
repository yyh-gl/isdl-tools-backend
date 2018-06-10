class Api::Analysis::VisionsController < ApplicationController
  require 'google/cloud/vision'

  # POST /api/analysis/visions/face
  def analyze_face
    result = get_image_information(params['image_path'])
    json_response(result.faces.to_json)
  end

  # POST /api/analysis/visions/label
  def analyze_label
    result = get_image_information(params['image_path'])
    json_response(result.labels.to_json)
  end

  def get_image_information(image_path)
    vision = Google::Cloud::Vision.new project: ENV['GOOGLE_PROJECT_ID']
    vision.image(image_path)
  end

  swagger_controller :Visions, '画像認識API'

  swagger_api :analyze_face do
    summary 'Get result of image recognition(face)'
    consumes ['application/json']
    param :query, :image_path, :string, :required, 'Path to image'
    response :ok, 'Success', :Conversation
    response :bad_request
    response :unauthorized
    response :internal_server_error
  end

  swagger_api :analyze_label do
    summary 'Get result of image recognition(label)'
    consumes ['application/json']
    param :query, :image_path, :string, :required, 'Path to image'
    response :ok, 'Success', :Conversation
    response :bad_request
    response :unauthorized
    response :internal_server_error
  end

  swagger_model :Vision do
    description 'Vision parameters'
    property :conversation, :string, :required, '画像に関する情報〜'
  end

end
