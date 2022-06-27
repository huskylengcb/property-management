require 'json'

module Wx
  class Client
    def initialize(type=:default)
      @conn = Faraday.new(url: 'https://api.weixin.qq.com', ssl: { verify: false }, headers: { 'Content-Type' => 'application/json' }) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.request :json
        faraday.response :json
      end
    end

    def login(code)
      @conn.get "/sns/jscode2session?appid=#{::Settings.app_id}&secret=#{::Settings.app_secret}&js_code=#{code}&grant_type=authorization_code"
    end

    def success?(response)
      (
        response.status == 200 &&
        response.body.is_a?(Hash) &&
        response.body['error_code'].nil?
      )
    end
  end
end
