module ApplicationHelper

	def pretty_time(time)
		return time.localtime.strftime("%A, %d %b %Y %l:%M %p")
	end

end
