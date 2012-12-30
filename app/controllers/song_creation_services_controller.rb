class SongCreationServicesController < ApplicationController
  respond_to :html, :js

  def new
    @song_creation_service = SongCreationService.new
  end

  def create
    @song_creation_service = SongCreationService.new(params[:song_creation_service])

    if @song_creation_service.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
end
