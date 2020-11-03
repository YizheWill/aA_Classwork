class UsersController < ApplicationController
  before_action :ensure_not_signed_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      # don't know how to do it yet.
      redirect_to cats_url
      #prepare for bug
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
