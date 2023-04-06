class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :login?

  include AdminAuthenticatedSystem

  def login?
    if !logged_in?
      flash[:alert] = "请先登录"
      redirect_to admin_login_path
    end
  end
end