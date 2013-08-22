require 'test_helper'

class FlashGordonTest < ActiveSupport::TestCase

  test "FlashGordon module defined" do
    assert_kind_of Module, FlashGordon
  end

  test "FlashGordon::Flash class defined" do
    assert_kind_of Class, FlashGordon::Flash
  end

  test "FlashGordon initializes with preset zones" do
    assert_not_equal({}, FlashGordon.zones)
  end

  test "FlashGordon.reset_zones should give empty array for each zone" do
    FlashGordon::Flash.append("Testing")
    assert_equal(FlashGordon.zones, FlashGordon::Flash.reset)
  end

  test "FlashGordon.add_zone(:zone_name) should give a new zone in the zones hash" do
    new_zones = [:pewpewpew, :bambambam, :beeroclock]
    new_zones.each do |z|
      FlashGordon.add_zone(z.to_sym)
    end
    new_zones << :anger # Test for initializer added zone
    assert_equal(new_zones.sort, FlashGordon.new_zones.sort)
  end

end
