require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "filter cities and non-precies places from being registered" do
    user = User.new
    places = []
    place_corona = {
      "amenity" => "cafe",
      "cuisine" => "french",
      "name" => "Corona",
      "address" => "Corona, Quai du Louvre, Quartier Saint-Germain-l'Auxerrois, Paris 1er Arrondissement, Paris, Île-de-France, France métropolitaine, 75001, France",
      "osm_id" => 3396587307,
      "latitude" => 48.859096,
      "longitude" => 2.3402013
    }
    places.push(place_corona)
    place_city = {
      "type" => "city"
    }
    places.push(place_city)
    place_administrative = {
      "type" => "administrative"
    }
    places.push(place_administrative)
    place_normal = {
      "amenity" => "cafe"
    }
    places.push(place_normal)
    place_osm_relation = {
      "osm_type" => "relation"
    }
    places.push(place_osm_relation)
    place_raw = {
      "raw" => {
        "amenity" => "cafe"
      }
    }
    places.push(place_raw)

    filtered_places = user.filter_places(places)

    expected_places = []
    expected_places.push(place_corona)
    expected_places.push(place_normal)
    expected_places.push(place_raw)

    assert_equal(expected_places, filtered_places)
  end
end
