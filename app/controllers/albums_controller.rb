class AlbumsController < ApplicationController
  def index 
    render json: Album.order(:year)
  end

  def create 
    params[:albums].each do |album|
      Album.create(
        artist: album[:attributes][:artistName],
        title: album[:attributes][:name],
        year: album[:year],
        image_url: album[:imageUrl],
        wikipedia: "",
        pitchfork: ""
      )
    end 
    render status: :created
  end

  def update 
    album = Album.find(params[:id])
    album.update(
      artist: params[:artist],
      title: params[:title],
      year: params[:year],
      image_url: params[:image],
      wikipedia: params[:wikipedia],
      pitchfork: params[:pitchfork] 
    )
    render status: :no_content
  end

  def destroy
    params[:albums].each do |album|
      album_to_delete = Album.find_by(artist: album[:artist], title: album[:title])
      album_to_delete.destroy
    end
    render status: :no_content
  end
  
  def seed 
    params[:albums].each do |album|
      Album.create(
        artist: album[:attributes][:artistName],
        title: album[:attributes][:name],
        year: album[:year],
        image_url: album[:imageUrl] || "",
        wikipedia: "",
        pitchfork: ""
      )
    end 
    render status: :ok
  end
end
