class AlbumsController < ApplicationController
  inherit_resources

  caches_action :show
  cache_sweeper :album_sweeper

  def edit
    edit! do
      @band = @album.band
    end
  end
end
