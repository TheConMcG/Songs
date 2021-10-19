class SongsController < ApplicationController

  def index
    songs = Song.all 
    render json: songs.as_json
  end

  def create
    song = Song.new(
      title: params[:title],
      artist: params[:artist],
      album: params[:album],
      year: params[:year]
    )
    song.save
    render json: Song.last
  end

  def show
    song = Song.find_by(id: params[:id])
    render json: song.as_json
  end

  def update
    song = Song.find_by(id: params[:id])
    song.title = params[:title] || song.name
    song.artist = params[:artist] || song.artist
    song.album = params[:album] || song.album
    song.year = params[:year] || song.year
    song.save
    render json: song.as_json
  end

  def destroy
    song = Song.find_by(id: params[:id])
    song.destroy
    render json: {message: "That song has been removed."}
  end
  
end
