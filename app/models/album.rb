class Album < ActiveRecord::Base
  attr_accessible :title, :cover_art

  has_many :songs
  belongs_to :band
end
