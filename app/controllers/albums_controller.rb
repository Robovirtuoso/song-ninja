class AlbumsController < ApplicationController
  inherit_resources

  def create
    create! do
      Album.create(permitted_attributes(symbolize_model(Album)))
    end
  end

  def edit
    edit! do
      @band = @album.band
    end
  end
end
