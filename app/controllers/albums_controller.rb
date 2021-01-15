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
        apple_music_id: album[:id],
        genre: album[:attributes][:genreNames][0],
        track_count: album[:attributes][:trackCount],
        date_added: album[:attributes][:dateAdded],
        wikipedia: '',
        pitchfork: ''
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
    album_to_delete = Album.find(params[:id])
    album_to_delete.destroy
    render status: :no_content
  end

  def seed
    params[:albums].each do |album|
      Album.create(
        artist: album[:attributes][:artistName],
        title: album[:attributes][:name],
        year: album[:year],
        image_url: album[:imageUrl] || '',
        apple_music_id: album[:id],
        genre: album[:attributes][:genreNames][0],
        track_count: album[:attributes][:trackCount],
        date_added: album[:attributes][:dateAdded],
        wikipedia: '',
        pitchfork: ''
      )
    end
    render status: :ok
  end

  def extra_apple_music_data
    params[:albums].each do |album|
      apple_music_id = album[:id]
      genre = album[:attributes][:genreNames][0]
      track_count = album[:attributes][:trackCount]
      date_added = album[:attributes][:dateAdded]
      album_to_edit = Album.find_by(title: album[:attributes][:name])
      next unless album_to_edit

      album_to_edit.update(
        apple_music_id: apple_music_id,
        genre: genre,
        track_count: track_count,
        date_added: date_added
      )
    end
    render json: :ok
  end
end
