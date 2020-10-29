class ChirpsController < ApplicationController
  def index
    render json: Chirp.all
  end

  def show
    debugger
  end

  def create
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
