class AlbumCreationService < ApplicationService
  attr_reader :album, :band

  attribute :band, String
  attribute :album, String

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
    create_album!
  end

  def fetch
    @record = BlueConductor.record_for(band, album)
  end

  def create_album!
    @record.songs.each do |song|
      BandEngineer.new(song).build
    end
  end
end
