class Api::V1::MinpsController < Api::V1::BaseController
  def login
    client = Wx::Client.new
    result = client.login(params[:code])
    if (result.success?)
      user = User.find_by(open_id: result.body["openid"]) || User.create({open_id: result.body["openid"]})
      @current_user = user
      session[:user_id] = user.id
      api_success(message: '授权成功', data: { current_user: @current_user.detail_builder })
    else
      api_error(message: '授权失败', data: "ERROR" )
    end
  end
end
