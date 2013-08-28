module SessionsHelper
  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def login_user(user)
    session[:token] = user.session_token
  end

  def require_logged_in
    redirect_to new_session_url unless current_user
  end

  def logout
    current_user.generate_token
    session[:token] = nil
  end
end
