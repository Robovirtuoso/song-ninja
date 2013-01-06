class Song < ActiveRecord::Base
  attr_accessible :band_id, :album_id, :lyrics, :title

  belongs_to :album
  belongs_to :band
end
