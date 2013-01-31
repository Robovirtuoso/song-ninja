class AlbumCreationServicesController < ApplicationController

  def new
    @album_service = AlbumCreationService.new
  end

  def create
    @album_service = AlbumCreationService.new(parameters)

    if @album_service.save
      redirect_to [ current_user, @album_service.band, @album_service.album ]
    else
      redirect_to root_url, alert: @album_service.errors.full_messages.join(", ")
    end
  end

  private

  def parameters
    permitted_params.current_model(:album_creation_service)
  end
end
