class Interest < ApplicationRecord
  has_and_belongs_to_many :users

  # validates :name, uniqueness: { case_sensitive: false }
  validates :name, uniqueness: { case_sensitive: false,
    scope: :user_id }
end
