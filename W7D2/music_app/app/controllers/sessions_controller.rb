# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      log_in_user!(user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["invalid credentials"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
