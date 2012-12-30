class SongCreationService
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :band, :song

  attribute :band_name, String
  attribute :song_name, String

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
    create_track
    create_band
    create_song
  end

  def retrieve_track_info
    @track = BlueConductor.song_for(band_name, song_name)
  end

  def create_band
    @band = Band.where(name: @track.band).first || Band.create!(name: @track.band)
  end

  def create_song
    @song = @band.songs.create!(title: @track.title, lyrics: @track.lyrics)
  end
end
