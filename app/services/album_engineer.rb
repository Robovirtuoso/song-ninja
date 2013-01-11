class AlbumEngineer

  def initialize(band, album)
    @band  = band
    @album = album
  end

  def build
    album
  end

  private

  def album
    @band.albums.where(title: @album, image: @image).first_or_create
  end
end
