class HomeController < ApplicationController

  def index
    @song_service = SongCreationService.new
    @album_service = AlbumCreationService.new
  end
end
