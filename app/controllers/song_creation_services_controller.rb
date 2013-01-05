class SongCreationServicesController < ApplicationController
  respond_to :html, :js

  def new
    @song_creation_service = SongCreationService.new
  end

  def create
    @song_creation_service = SongCreationService.new(params[:song_creation_service])

    if @song_creation_service.save
      redirect_to [ current_user, @song_creation_service.band, @song_creation_service.album, @song_creation_service.song ]
    else
      redirect_to root_url
    end
  end
end
