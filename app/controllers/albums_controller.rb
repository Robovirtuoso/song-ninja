class AlbumsController < ApplicationController
  inherit_resources

  def edit
    edit! do
      @band = @album.band
    end
  end
end
