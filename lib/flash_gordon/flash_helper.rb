module FlashGordon
  module FlashHelper
    def render_flash
      FlashGordon::Flash.render.each_pair do |k,v|
        unless v.empty?
          unless flash.now[k]
            flash.now[k] = v unless v.empty?
          else
            flash.now[k] << ("<br/>" + v) unless v.empty?
          end
        end
      end
      FlashGordon::Flash.reset
      flash.map{|f| "<div class='alert alert-#{f[0]}'>#{f[1]}</div>"}.join.html_safe
    end
  end
end
