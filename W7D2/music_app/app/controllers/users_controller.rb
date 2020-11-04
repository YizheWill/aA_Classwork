# frozen_string_literal: true

# class  documentation
class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = errors.full_messages
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
