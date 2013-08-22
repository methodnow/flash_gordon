class PagesController < ApplicationController
  def home
    FlashGordon::Flash.append("success")
  end
end
