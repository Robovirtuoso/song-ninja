class Album < ActiveRecord::Base
  attr_accessible :title

  has_many :songs, dependent: :destroy
  belongs_to :band
end
