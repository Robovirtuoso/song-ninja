class SongCreationService < ApplicationService
  attr_reader :band, :song

  attribute :band, String
  attribute :song, String

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
    create_song!
  end

  def fetch
    @track = BlueConductor.song_for(band, song)
  end

  def create_song!
    BandEngineer.new(@track).build
  end
end
