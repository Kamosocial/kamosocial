class Place < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :interests, through: :users
end
