class SongCreationServicesController < ApplicationController
  respond_to :html, :js

  def new
    @song_service = SongCreationService.new
  end

  def create
    @song_service = SongCreationService.new(params[:song_creation_service])

    if @song_service.save
      band = Band.where(name: @song_service.band).first
      album = Album.where(band_id: band.id).first
      song = Song.where(title: @song_service.song).first

      redirect_to [ current_user, band, album, song ]
    else
      redirect_to root_url
    end
  end
end
