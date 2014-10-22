class Catalog < ActiveRecord::Base
  # Remember to create a migration!
  has_many :songs
  has_many :genres
end
