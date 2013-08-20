require 'flash_gordon/flash'
require 'flash_gordon/flash_helper'

module FlashGordon
  class Railtie < Rails::Railtie
    initializer "flash_gordon.flash_helper" do |app|
      ActionView::Base.send :include, FlashHelper
    end
  end
end
