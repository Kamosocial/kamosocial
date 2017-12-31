class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :trackable, :validatable

  validates :username, uniqueness: { case_sensitive: false }

  has_many :interests

  def interests_list=value
    value.split(',').each do |interest|
      self.interests.build(:name => interest).save
    end
  end

  def interests_list
    self.interests.join(',')
  end
end
