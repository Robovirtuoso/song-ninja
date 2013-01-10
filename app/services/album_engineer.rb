class AlbumEngineer

  def initialize(band, album)
    @band  = band
    @album = album
  end

  def build
    album
  end

  def album
    @band.albums.where(title: @album).first_or_create
  end
end
