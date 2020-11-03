class ApplicationController < ActionController::Base
  helper_method :current_user

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_not_signed_in
    redirect_to cats_url if current_user
  end

  def logout
    @current_user = nil
    redirect_to new_session_url
  end
end
