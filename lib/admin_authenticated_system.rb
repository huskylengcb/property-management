module AdminAuthenticatedSystem
  def self.included(base)
    base.send :helper_method, :current_user, :logged_in?
  end

  protected
  def logged_in?
    current_user
  end

  def logged_in!(user, request = nil)
    self.current_user = user
    return unless request
  end

  def current_user
    @current_admin_user ||= login_from_session
  end

  def current_user=(new_user)
    session[:admin_user_id] = (new_user.nil? || new_user.is_a?(Symbol)) ? nil : new_user.id
    @current_admin_user = new_user
  end

  def login_required
    return true if authorized?
    store_location
    flash[:notice] = "您需要登录后才能继续操作。"
    #让ajax请求弹出登录窗口
    if request.xhr?
      render :js =>  "window.location.replace('#{login_path(:return_to => request.referer)}')"
    else
      redirect_to(admin_login_path)
    end
  end

  def store_location
    next_url = request.get? ? request.url : request.referer
    session[:admin_return_to] = params[:admin_return_to] || next_url
  end

  def redirect_back_or_default(default = root_path)
    redirect_to redirect_default_url.presence || default
  end

  def redirect_default_url
    session_return_to = session.delete(:admin_return_to)
    params[:admin_return_to].presence || session_return_to
  end

  def login_from_session
    return unless session[:admin_user_id]
    user = AdminUser.find_by(id: session[:admin_user_id])
    self.current_user = user
    reset_session unless @current_admin_user
    return @current_admin_user
  end

end
