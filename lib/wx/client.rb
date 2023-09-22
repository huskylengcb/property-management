require 'json'
require "addressable/uri"

module Wx
  class Client
    def initialize
      @conn = Faraday.new(url: 'https://api.weixin.qq.com', ssl: { verify: false }, headers: { 'Content-Type' => 'application/json' }) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.request :json
        faraday.response :json
      end
    end

    def login(code)
      @conn.get "/sns/jscode2session?appid=#{::Settings.app_id}&secret=#{::Settings.app_secret}&js_code=#{code}&grant_type=authorization_code"
    end

    def get_access_token
      response = @conn.get "/cgi-bin/token?grant_type=client_credential&appid=#{::Settings.app_id}&secret=#{::Settings.app_secret}"
      success?(response) ? response.body["access_token"] : nil
    end

    def send_message
      params = {
        "touser": "oKSN85SixIjjtwgTTl0tuKYQ6SWs",
        "weapp_template_msg":{
            "template_id":"zgvJHwIk-H_wSwS0Bp2Sihnj5G782hNFFIFwhTYOnY4",
            "page":"page/page/index",
            "form_id":"FORMID",
            "data":{
                "keyword1":{
                    "value":"339208499"
                },
                "keyword2":{
                    "value":"2015年01月05日 12:30"
                },
                "keyword3":{
                    "value":"腾讯微信总部"
                },
                "keyword4":{
                    "value":"广州市海珠区新港中路397号"
                }
            },
            "emphasis_keyword":"keyword1.DATA"
        }
      }
      @conn.post do |req|
        req.url Addressable::URI.parse("/cgi-bin/message/wxopen/template/uniform_send?access_token=#{self.get_access_token}")
        req.body = ::JSON.dump(params)
      end
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
