module FlashGordon
  mattr_accessor :zones

  @@zones = {}

  def self.setup
    yield self
  end

  def self.init_zone
    zone_list = "warning danger info success error"
    zone_list.split(" ").each{|z| @@zones[z.to_sym] = []}
    true
  end

  def self.add_zone(zone)
    @@zones[zone.to_sym] = [] unless @@zones[zone.to_sym]
    @@default_zones[zone.to_sym] = [] unless @@zones[zone.to_sym]
    true
  end

  def self.reset_zones
    reset_zones = {}
    @@zones.each_key do |k|
      reset_zones[k] = []
    end
    self.zones = reset_zones
  end

  self.init_zone
end

require 'flash_gordon/railtie' if defined? Rails
