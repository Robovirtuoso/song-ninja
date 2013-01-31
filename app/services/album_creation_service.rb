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
    bnd
    albm
    sngs
  end

  def fetch
    @record = BlueConductor.record_for(band, album)
  end

  def bnd
    @band = BandEngineer.new(band).build
  end

  def albm
    @album = AlbumEngineer.new(@band, @record).build
  end

  def sngs
    @record.songs.each do |song|
      SongEngineer.new(@album, song).build
    end
  end
end
