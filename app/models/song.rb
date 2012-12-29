class Song < ActiveRecord::Base
  attr_accessible :band_id, :lyrics, :title

  belongs_to :band
end
