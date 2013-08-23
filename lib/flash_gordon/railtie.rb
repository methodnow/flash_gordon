require 'flash_gordon/flash'
require 'flash_gordon/flash_helper'
require 'flash_gordon/reset_flashes'

module FlashGordon
  class Railtie < Rails::Railtie
    initializer "flash_gordon.flash_helper" do |app|
      ActionView::Base.send :include, FlashHelper
      ActionController::Base.send :include, ResetFlashes
    end
  end
end
