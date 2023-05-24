module AuthenticatedSystem
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
    @current_user ||= login_from_session
  end

  def current_user=(new_user)
    session[:user_id] = (new_user.nil? || new_user.is_a?(Symbol)) ? nil : new_user.id
    @current_user = new_user
  end

  def login_from_session
    return unless session[:user_id]
    user = User.find_by(id: session[:user_id])
    self.current_user = user
    reset_session unless @current_user
    return @current_user
  end

end
