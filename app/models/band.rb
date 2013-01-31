class Band < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  has_many :albums, dependent: :destroy
end
