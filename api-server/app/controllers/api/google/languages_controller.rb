class Api::Google::LanguagesController < ApplicationController
  require 'google/cloud/language'

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

end
