module FlashGordon
	class Flash
    # Messages fall under different message zones, for now zones are hardcoded
    # eventually we can add custom ones via initializers

		@messages = {:error => [], :alert => [], :info => [], :log => [], :success => [], :warning => [], :danger => []}

		def self.append(message,zone=:warning, options={})
			# Added options for future use
			if @messages[zone]
				if message.class == Array
					message.each do |m|
						@messages[zone] << m
					end
				else
					@messages[zone] << message
				end
			else
				raise "Zone does not exist, please use the following zones - :error, :info, :log, :success, :warning, :alert"
			end
		end

		def self.render(zone=:all, glue="\n")
			if zone == :all
				@messages.each_pair do |k,v|
					@messages[k] = v.join(glue) unless v.empty?
				end
				@messages
			elsif @messages[zone]
				@messages[zone].join(glue)
			end
		end

		def self.reset
			@messages = {:error => [], :alert => [], :info => [], :log => [], :success => [], :warning => [], :danger => []}
		end
	end
end
