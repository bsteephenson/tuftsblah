module ApplicationHelper

	def pretty_time(time)
		return time.in_time_zone("EST").strftime("%A, %d %b %Y %l:%M %p")
	end

end
