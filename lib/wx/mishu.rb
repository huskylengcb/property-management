require 'json'
require "addressable/uri"

module Wx
  class Mishu
    def initialize
      @conn = Faraday.new(url: 'https://api-bot.aibotk.com', ssl: { verify: false }, headers: { 'Content-Type' => 'application/json' }) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.request :json
        faraday.response :json
      end
    end

    def send_contact
      params = {
        apiKey: "f4284d7243f6ded8b6661efa98faaf1db88b6d1c",
        name: "咿呀咿呀哟",
        wxid: "@7218fe990f69b371f9a047ba29ec08deadfc2343e3a03597ef63e6571344bb53",
        message: {
          type: 1,
          content: "哈哈哈哈"
        }
      }
      @conn.post do |req|
        req.url Addressable::URI.parse("/openapi/v1/chat/contact")
        req.body = ::JSON.dump(params)
      end
    end

    def send_room(params)
      @conn.post do |req|
        req.url Addressable::URI.parse("/openapi/v1/chat/room")
        req.body = ::JSON.dump(params)
      end
    end

    # message数据类型

    # 参数名	    必填	类型	说明	默认值
    # type	      是	number	消息类型：1 文字 2 图片url 3 图片base64 4 url卡片链接	1
    # content	    否	string	消息内容，如果type为1必填，内容换行使用\n	无
    # url	        否	string	type 为2，3，4必填，图片地址，或者文件地址，例如png,jpg或者zip，excel都可以，必须是网络地址	无
    # description	否	string	type 为4必填，卡片链接的描述	无
    # thumbnailUrl否	string	type 为4必填，卡片链接的缩略图，网络图片地址	无
    # title	      否	string	type 为4必填，卡片标题内容
    def build_message(type, content)
      {type: type, content: content}
    end

    def build_room_params(roomName, message)
      {apiKey: "f4284d7243f6ded8b6661efa98faaf1db88b6d1c", roomName: roomName, message: message}
    end
  end
end