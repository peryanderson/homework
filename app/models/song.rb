class Song < ActiveRecord::Base
  # Remember to create a migration!
  has_many :catalogs
  has_many :genres, through: :catalogs
end
