# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    user.reset_session_token!
    user.save!
    session[:session_token] = user.session_token
  end

  def logout
    if current_user
      user.reset_session_token!
      user.save!
      session[:session_token] = nil
    end
    redirect_to new_session_url
  end

  def require_logged_in
    redirect_to new_session_url unless current_user
  end
end
