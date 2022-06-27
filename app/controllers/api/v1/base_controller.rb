class Api::V1::BaseController < ApplicationController

  skip_before_action :verify_authenticity_token

  protected

  def api_error(status: 400, message: '', data: {})
    render json: {status: status, message: message, data: data}
  end

  def api_success(message: '', data: {})
    render json: {status: 0, message: message, data: data}
  end
end
