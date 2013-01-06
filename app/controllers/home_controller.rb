class HomeController < ApplicationController
  def index
    @song_creation_service = SongCreationService.new
    @album_creation_service = AlbumCreationService.new
  end
end
