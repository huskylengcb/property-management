class Admin::SessionsController < ApplicationController
  layout 'admin_login'

  include AdminAuthenticatedSystem

  def new
  end

  def create
    @admin_user = AdminUser.find_by(login_name: session_params[:login_name])
    if @admin_user.blank?
      flash[:alert] = '该帐号不存在'
      render action: :new, status: :unprocessable_entity and return
    end
    unless @admin_user.authenticate(session_params[:password])
      flash[:alert] = '用户名密码错误'
      render action: :new, status: :unprocessable_entity and return
    end
    logged_in!(@admin_user)
    redirect_to admin_main_path
  end

  def destroy
    if logged_in?
      cookies.delete :login_token
      session.delete(:admin_user_id)
      flash.now[:notice] = "已成功注销."
      redirect_to admin_login_path
    end
  end

  private
  def session_params
    params.require(:admin_user).permit(:login_name, :password)
  end
end

