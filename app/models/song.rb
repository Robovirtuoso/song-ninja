class Song < ActiveRecord::Base
  belongs_to :album, touch: true
  belongs_to :band, touch: true
end
