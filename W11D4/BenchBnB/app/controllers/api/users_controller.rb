class Api::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render :show
        end 
        # add in error handling later

    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
