class SongCreationService
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :band, :song, :album

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
    retrieve_track_info
    create_band
    create_album
    create_song
  end

  def retrieve_track_info
    @track = BlueConductor.song_for(band_name, song_name)
  end

  def create_band
    @band = Band.where(name: @track.band).first || Band.create!(name: @track.band)
  end

  def create_album
    @album = Album.where(title: @track.album).first || @band.albums.create!(title: @track.album)
  end

  def create_song
    @song = @album.songs.create!(title: @track.title, lyrics: @track.lyrics)
  end
end
