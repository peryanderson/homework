class Genre < ActiveRecord::Base
  # Remember to create a migration!
  has_many :catalogs
  has_many :songs, through: :catalogs
end
