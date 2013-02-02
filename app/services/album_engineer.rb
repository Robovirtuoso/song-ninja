class AlbumEngineer

  def initialize(band, record)
    @band   = band
    @record = record
  end

  def build
    album
  end

  def self.validates(band, record)
    band.albums.where(title: record).first
  end

  private

  def album
    @band.albums.where(title: @record.title, image: @record.image).first_or_create
  end
end
