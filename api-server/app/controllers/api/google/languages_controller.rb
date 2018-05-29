class Api::Google::LanguagesController < ApplicationController
  require 'google/cloud/language'

  # POST /api/google/languages
  def analyze
    language = Google::Cloud::Language.new
    text = params[:text]
    response = language.analyze_sentiment(content: text, type: :PLAIN_TEXT)
    sentiment = response.document_sentiment
    res_json = {
        result: {
            score: sentiment.score,
            magnitude: sentiment.magnitude
        }
    }
    json_response(res_json)
  end

  swagger_controller :Languages, '言語処理API'

  swagger_api :analyze do
    summary 'Analyze sentiment in text'
    consumes ['application/json']
    param :query, :text, :string, :required, '私はとても悲しい。でも、友達が励ましてくれたおかげで、今はとても元気です。'
    response :ok, 'Success', :Result
    response :internal_server_error
  end

  swagger_model :Result do
    description 'Result parameters'
    property :result, :object, :required, 'Result object', { "$ref": 'Sentiment' }
  end

  swagger_model :Sentiment do
    description 'Sentiment parameters'
    property :score, :number, :required, 0.30000001192092896
    property :magnitude, :number, :required, 1.2999999523162842
  end

end
