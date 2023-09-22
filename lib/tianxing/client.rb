require 'json'
require "addressable/uri"

module Tianxing
  class Client
    def initialize
      @conn = Faraday.new(url: 'https://apis.tianapi.com', ssl: { verify: false }, headers: { 'Content-Type' => 'application/json' }) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.request :json
        faraday.response :json
      end
    end

    def citylookup
      @conn.get Addressable::URI.parse("/citylookup/index?key=bd78df4ea5ac356f940a27b971ac6728&area=黄岛")
    end

    def tianqi
      @conn.get "/tianqi/index?key=bd78df4ea5ac356f940a27b971ac6728&city=101120206&type=1"
    end
  end
end