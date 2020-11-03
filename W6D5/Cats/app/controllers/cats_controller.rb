class CatsController < ApplicationController
    before_action :set_cat, only: [:show, :edit, :update, :destroy]

    def index
        @cats = Cat.all
        render :index
    end

    
    def show
        render json: @cat
    end

    

    private
    
    def set_cat
        @cat = Cat.find_by(id: params[:id])
    end

    def cat_params
        params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
    end
end