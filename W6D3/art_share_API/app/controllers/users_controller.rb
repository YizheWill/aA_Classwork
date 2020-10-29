class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    render json: User.all
  end

  # def create
  #   # render json: params
  #   #be careful about sending dup data
  # end
  def create
    user = User.new(users_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end
  
  def update
    user = User.find_by(id: params[:id])

    if user.update(users_params)
        redirect_to user_url(user) # render json: user
    else 
        render json: users.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    user.destroy
    redirect_to users_url
  end

  private
  def users_params
    params.require(:user).permit(:username, :password, :email)
  end

end