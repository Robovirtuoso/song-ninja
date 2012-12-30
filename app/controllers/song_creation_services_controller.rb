class SongCreationServicesController < ApplicationController

  def new
    @song_creation_service = SongCreationService.new
  end

  def create
    @song_creation_service = SongCreationService.new(params[:song_creation_service])

    if @song_creation_service.save
      redirect_to home_path
    else
      redirect_to root_url
    end
  end
end
