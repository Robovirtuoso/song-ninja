class AlbumCreationService < ApplicationService
  attr_reader :album, :band

  attribute :band, String
  attribute :album, String

  validates :band, presence: true
  validates :album, presence: true

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    fetch
    band!
    album!
    songs!
  end

  def fetch
    @record = BlueConductor.record_for(band, album)
  end

  def band!
    @band = BandEngineer.new(band).build
  end

  def album!
    @album = AlbumEngineer.new(@band, @record).build
  end

  def songs!
    @record.songs.each do |song|
      SongEngineer.new(@album, song).build
    end
  end
end
