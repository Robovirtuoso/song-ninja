class Album < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  belongs_to :band, touch: true
end
