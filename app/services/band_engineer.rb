class BandEngineer

  def initialize(track)
    @track = track
  end

  def build
    band
    album
    song
  end

  def band
    @band ||= Band.where(name: @track.band).first_or_create
  end

  def album
    @album ||= @band.albums.where(title: @track.album).first_or_create
  end

  def song
    @album.songs.where(title: @track.title, lyrics: @track.lyrics).first_or_create
  end
end
