class Admin::SessionsController < ApplicationController
  layout 'admin_login'

  def new
  end

  def create
    # @admin_user = AdminUser.normal.find_by(login_name: session_params[:login_name])
    # if @admin_user.blank?
    #   flash[:alert] = '该帐号不存在'
    #   render action: :new and return
    # end
    # # if @admin_user.storekeeper? or @admin_user.expo_manager?
    # #   flash[:alert] = '该帐号没有权限'
    # #   render action: :new and return
    # # end
    # unless @admin_user.normal?
    #   flash[:alert] = '该帐号状态异常，不能登录'
    #   render action: :new and return
    # end
    # # 如果是之前导入的账号，需要md5一下
    # if @admin_user.improt_user?
    #   params['admin_user']['password']= Encryption.md5(params['admin_user']['password'])
    # end
    # unless @admin_user && @admin_user.authenticate(session_params[:password])
    #   flash[:alert] = '用户名密码错误'
    #   render action: :new and return
    # end
    # if verify_rucaptcha?(@admin_user)
    #   logged_in!(@admin_user)
    #   redirect_to admin_main_path
    # else
    #   flash[:alert] = '验证码错误'
    #   render action: :new and return
    # end
  end

  def destroy
    # if logged_in?
    #   cookies.delete :login_token
    #   session.delete(:zhongfu_admin_user_id)
    #   flash[:notice] = "已成功注销."
    #   redirect_to admin_login_path
    # end
  end

  private
  def session_params
    params.require(:admin_user).permit(:login_name, :password)
  end
end

