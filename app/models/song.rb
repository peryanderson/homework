class Song < ActiveRecord::Base
  # Remember to create a migration!
  has_one :catalog
  has_many :genres, through: :catalog
end
