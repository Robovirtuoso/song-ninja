class AlbumCreationServicesController < ApplicationController

  def new
    @album_service = AlbumCreationService.new
  end

  def create
    @album_service = AlbumCreationService.new(params[:album_creation_service])

    if @album_service.save
      band = Band.where(name: @album_service.band).first
      album = Album.where(title: @album_service.album).first

      redirect_to [ current_user, band, album ]
    else
      redirect_to root_url
    end
  end
end
