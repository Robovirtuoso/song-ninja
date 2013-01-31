class SongCreationService < ApplicationService
  attr_reader :band, :song, :album

  attribute :band, String
  attribute :song, String

  validates :band, presence: true
  validates :song, presence: true

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
    sng
  end

  def fetch
    @track = BlueConductor.song_for(band, song)
  end

  def bnd
    @band = BandEngineer.new(band).build
  end

  def albm
    @album = AlbumEngineer.validates(@band, @track.album) ||
      AlbumEngineer.new(@band, BlueConductor.art_for(@band.name, @track.album)).build
  end

  def sng
    @song = SongEngineer.new(@album, @track).build
  end
end
