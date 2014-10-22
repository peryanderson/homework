class Genre < ActiveRecord::Base
  # Remember to create a migration!
  has_one :catalog
  has_many :songs, through: :catalog
end
