module ResetFlashes
	extend ActiveSupport::Concern

	included do
		append_before_filter :reset_zones
	end

	def reset_zones
		FlashGordon::Flash.reset
	end
end