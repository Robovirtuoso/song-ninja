class SongCreationServicesController < ApplicationController
  respond_to :html, :js

  def new
    @song_service = SongCreationService.new
  end

  def create
    @song_service = SongCreationService.new(params[:song_creation_service])

    if @song_service.save
      redirect_to [ current_user, @song_service.band, @song_service.album, @song_service.song ]
    else
      redirect_to root_url
    end
  end
end
