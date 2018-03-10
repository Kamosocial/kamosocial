require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "convert city to pois" do
    user = User.new
    place = {}
    place['raw'] = {
        osm_id: "59874",
        place_id: "177966113"
    }
    pois = user.convert_city_to_poi(place)
    assert_equal({"raw"=>{:osm_id=>"59874", :place_id=>"177966113"}}, pois)
  end
end
