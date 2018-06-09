class Api::Analysis::ConversationsController < ApplicationController
  DOCOMO_REGISTRATION_URL = "https://api.apigw.smt.docomo.ne.jp/naturalTaskRecog/v1/registration?APIKEY=#{ENV['DOCOMO_API_KEY']}".freeze
  DOCOMO_REQUEST_URL = "https://api.apigw.smt.docomo.ne.jp/naturalTaskRecog/v1/dialogue?APIKEY=#{ENV['DOCOMO_API_KEY']}".freeze
  TASK_ID = {
      'ST001001' => '天気検索', 'ST001002' => 'ニュース検索',
      'ST003001' => 'ガソリンスタンド検索', 'ST003002' => '駐車場検索',
      'ST003003' => 'グルメ検索'
  }.freeze

  # POST /api/docomo/conversations
  def understand
    uri = URI.parse(DOCOMO_REQUEST_URL)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri)
    req['Content-Type'] = 'application/json;charset=UTF-8'
    app_id = registration
    now = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    json = {
      language: 'ja-JP',
      botId: 'TaskRecog',
      appId: app_id,
      voiceText: params['message'],
      appRecvTime: now,
      appSendTime: now
    }.to_json
    req.body = json
    res = https.request(req)

    res_hash = JSON.parse(res.body)
    TASK_ID.each do |key, val|
      if res_hash['dialogStatus']['task']['taskId'] == key
        res_hash['dialogStatus']['task']['taskId'] = val
      end
    end
    res_json = res_hash.to_json
    json_response(res_json)
  end

  swagger_controller :Analysis, '自然対話（意図解釈）API（ドコモ）'

  swagger_api :understand do
    summary 'Get result of intention understanding'
    consumes ['application/json']
    param :query, :message, :string, :required, 'Conversation content'
    response :ok, 'Success', :Restaurant
    response :bad_request
    response :unauthorized
    response :internal_server_error
  end

  private

  def registration
    uri = URI.parse(DOCOMO_REGISTRATION_URL)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri)
    req['Content-Type'] = 'application/json'
    json = {
      botId: 'TaskRecog',
      appKind: 'Smart Phone'
    }.to_json
    req.body = json
    res = https.request(req)
    JSON.parse(res.body)['appId']
  end

end
