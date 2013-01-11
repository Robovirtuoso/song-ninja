class SongEngineer

  def initialize(album, song)
    @album = album
    @song  = song
  end

  def build
    song
  end

  private

  def song
    @album.songs.where(title: @song.title, lyrics: @song.lyrics).first_or_create
  end
end
