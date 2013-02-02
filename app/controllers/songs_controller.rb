class SongsController < ApplicationController
  inherit_resources

  caches_action :show
  cache_sweeper :song_sweeper

  respond_to :html, :json, :js

  def show
    show! do
      @album = Album.find(params[:album_id])
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [current_user, @song.band, @song] }
      failure.html { redirect_to [current_user, @song.band, @song] }
    end
  end
end
