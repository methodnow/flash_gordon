module FlashGordon
  module FlashHelper
  	@first_flash = true
    def render_flash(zone=:all, glue="</br>", tag="div")
    	# Assigns flash messages to flash object before rendering
    	to_flash = assign_flash(FlashGordon::Flash.render(zone,glue),zone)
      to_flash.map{|f| "<#{tag} class='alert alert-#{f[0]}'>#{f[1]}</#{tag}>"}.join.html_safe
    end

    def assign_flash(flashes, zone)
    	to_flash = {}
      flashes.each_pair do |k,v|
      		# Checks if there is an existing value which is not from FlashGordon
      		# if exists, it will append the new values with <br/> tags
    		to_flash[k] = flash.now[k] if flash.now[k]
    		if to_flash[k]
    			to_flash[k] << ("<br/>" + v)
    		else
    			to_flash[k] = v
    		end
      end
    end
  end
end
