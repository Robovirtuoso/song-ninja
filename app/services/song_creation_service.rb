
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
    @track = BlueConductor.song_for(band_name, song_name)
    @band = Band.create!(name: @track.band)
    @song = @band.songs.create!(title: @track.title, lyrics: @track.lyrics)
  end
end
