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
    @band = Band.create!(name: band_name)
    @song = @band.songs.create!(title: song_name)
  end
end
