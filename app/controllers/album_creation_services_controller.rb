class AlbumCreationServicesController < ApplicationController

  def new
    @album_service = AlbumCreationService.new
  end

  def create
    @album_service = AlbumCreationService.new(params[:album_creation_service])

    if @album_service.save
      redirect_to [ current_user, @album_service.band, @album_service.album ]
    else
      redirect_to root_url
    end
  end
end
