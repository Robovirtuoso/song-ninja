class AlbumsController < ApplicationController
  inherit_resources

  def edit
    edit! do
      @band = @album.band
    end
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(album_params)
    super
  end

  private

  def album_params
    permitted_params.current_model(:album)
  end
end
