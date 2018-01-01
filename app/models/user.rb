class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :trackable, :validatable

  has_and_belongs_to_many :interests
  has_and_belongs_to_many :places

  validates :username, uniqueness: { case_sensitive: false }
  validates_associated :interests

  accepts_nested_attributes_for :interests

  def interests_list=value
    current_interest = value.split(',').collect{|interest| interest.strip.downcase}.uniq
    current_interest.each do |interest|
      self.interests << Interest.find_or_create_by(name: interest)
    end
  end

  def interests_list
    self.interests.join(',')
  end
end
