class Api::SessionsController < ApplicationController
  before_action :require_logged_in!, only: [:destroy]


  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
        if @user
            login!(@user)
           # to_render = {}
           # to_render['id'] = @user['id']
           # to_render['username'] = @user['username']
            render 'api/users/show' # to_render.to_json
        else
            render json: ['Invalid username or password'].to_json, status: 404
            
        end
  end

  def destroy
    logout!
    render json: {}.to_json
  end

    
end

