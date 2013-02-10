class SongsController < ApplicationController
  inherit_resources

  respond_to :html, :json, :js

  def show
    show! do
      @album = Album.find(params[:album_id])
    end
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(song_params)

    update! do |success, failure|
      success.html { redirect_to [current_user, @song.band, @song] }
      failure.html { redirect_to [current_user, @song.band, @song] }
    end
  end

  private

  def song_params
    permitted_params.current_model(:song)
  end
end
