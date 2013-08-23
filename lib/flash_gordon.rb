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
    true
  end

  def self.reset_zones
    @@zones.each_key do |k|
      @@zones[k] = []
    end
    @@zones
  end

  def self.hash_compare(a,b)
    (a.size > b.size ? a.to_a - b.to_a : b.to_a - a.to_a).flatten
  end

  private_class_method :hash_compare

  def self.new_zones
    hash_compare(@@zones, @@default_zones)
  end

  self.init_zone
end

require 'flash_gordon/railtie' if defined? Rails
