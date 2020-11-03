class SessionsController < ApplicationController
  before_action :ensure_not_signed_in, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by_credential(params[:user][:user_name], params[:user][:password])
    # debugger
    if @user
      login(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    logout
  end
end
