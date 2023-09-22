namespace :send_wx_message do
  desc "天气"
  task :tianqi => :environment do
    tianxing_client = Tianxing::Client.new
    tianqi = tianxing_client.tianqi
    result = tianqi.body["result"]
    content = "#{result["date"]} #{result["week"]} #{result["area"]}\n
    #{result["weather"]}\n
    当前气温：#{result["real"]}[#{result["lowest"]}~#{result["highest"]}]\n
    #{result["wind"]}#{result["windsc"]} 空气质量：#{result["quality"]}\n
    #{result["tips"]}
    "
    wx_mishu_client = Wx::Mishu.new
    message = wx_mishu_client.build_message(1, content)
    params = wx_mishu_client.build_room_params("2011级纺工一班", message)
    wx_mishu_client.send_room(params)
  end
end