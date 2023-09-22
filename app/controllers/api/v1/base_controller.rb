class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :login?

  include AuthenticatedSystem

  def login?
    if !logged_in?
      api_error(status: 401, message: '授权失败，请先登录', data: "ERROR" )
    end
  end
end
