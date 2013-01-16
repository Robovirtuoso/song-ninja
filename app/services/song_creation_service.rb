class SongCreationService < ApplicationService
  attr_reader :band, :song, :album

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
    band!
    album!
    song!
  end

  def fetch
    @track = BlueConductor.song_for(band, song)
  end

  def band!
    @band = BandEngineer.new(band).build
  end

  def album!
    @album =
        if @band.albums.where(title: @track.album).exists?
          @band.albums.where(title: @track.album).first
        else
          AlbumEngineer.new(@band, BlueConductor.art_for(@band.name, @track.album)).build
        end
  end

  def song!
    @song = SongEngineer.new(@album, @track).build
  end
end
