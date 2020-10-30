class ArtworksController < ApplicationController
  def index
    
    if params[:artist_id]
        render json: User.find_by(id: params[:artist_id]).artworks
    elsif params[:viewer_id]
        render json: User.find_by(id: params[:viewer_id]).shared_artworks
    else #delete else statement later
        render json: Artwork.all
    end
  end

  # def create
  #   # render json: params
  #   #be careful about sending dup data
  # end
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    render json: artwork
  end
  
  def update
    artwork = Artwork.find_by(id: params[:id])

    if artwork.update(artwork_params)
        redirect_to user_url(artwork) # render json: artwork
    else 
        render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])

    artwork.destroy
    redirect_to artworks_url
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :img_url)
  end

end