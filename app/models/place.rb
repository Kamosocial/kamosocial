class Place < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :interests, through: :users

  validates :osm_id, uniqueness: { case_sensitive: false }
end
