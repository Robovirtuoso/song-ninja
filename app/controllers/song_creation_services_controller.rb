class SongCreationServicesController < ApplicationController
  respond_to :html, :js

  def new
    @song_service = SongCreationService.new
  end

  def create
    @song_service = SongCreationService.new(parameters)

    if @song_service.save
      redirect_to [ current_user, @song_service.band, @song_service.album, @song_service.song ]
    else
      redirect_to root_url, alert: @song_service.errors.full_messages.join(", ")
    end
  end

  private

  def parameters
    permitted_params.current_model(:song_creation_service)
  end
end
