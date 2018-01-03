require 'json'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :trackable, :validatable

  has_and_belongs_to_many :interests
  has_and_belongs_to_many :places

  validates :username, uniqueness: { case_sensitive: false }
  validates_associated :interests
  validates_associated :places

  accepts_nested_attributes_for :interests
  accepts_nested_attributes_for :places

  def interests_list=value
    current_interest = value.split(',').collect{|interest| interest.strip.downcase}.uniq
    current_interest.each do |interest|
      self.interests << Interest.find_or_create_by(name: interest)
    end
  end

  def interests_list
    self.interests.join(',')
  end

  def places_list=value
    current_place = JSON.parse(value)
    puts "currents place: #{current_place}"
    current_place.each do |place|
      place['name'] = place['label'].split(',')[0]
      puts "2.this place: #{place}"
      self.places << Place.create_with(name: place['name'],
                                        address: place['label'],
                                        latitude: place['y'].to_f,
                                        longitude: place['x'].to_f)
        .find_or_create_by(osm_id: place['raw']['osm_id'].to_i)
    end
  end

  def places_list
    self.places.join(',')
  end
end
