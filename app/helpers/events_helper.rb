module EventsHelper

	def error_message(model, attribute)
		if model.errors[attribute].present?
			model.errors[attribute].first
		end
	end

	def friendly_date(date)
		date.strftime('%d. %B %Y %H:%M')
	end

	def iso_format(date)
		#date.iso8601.delete('-').delete(':').delete('Z').delete('+')
		date.strftime('%Y%m%dT%H%M') + "00"
	end

	def add_to_g_cal(event)
	    #"https://www.google.com/calendar/render?action=TEMPLATE&text=Your+Event+Name&dates=20140127T224000Z/20140320T221500Z&details=For+details,+link+here:+http://www.example.com&location=Waldorf+Astoria,+301+Park+Ave+,+New+York,+NY+10022&sf=true&output=xml"
	    "http://www.google.com/calendar/render?action=TEMPLATE" +
	    "&trp=false" +
	    "&text=" + event.name +
	    "&location=" + event.city.name + 
	    "&details=" + event.website +
	    "&dates=" + iso_format(event.start_date) +
	    "/" + iso_format(event.end_date) #+
	   	# "&dates=" + event.start_date.iso8601.delete('-').delete(':') + 
	    # "/" + event.end_date.iso8601.delete('-').delete(':')
	    #{}"&dates=" + iso_format(event.start_date) + 
	    #{}"/" + iso_format(event.end_date) #+
	    #{}"&ctz=Europe/Vienna"
	end

	# def add_to_g_cal(event) #Europe/Vienna
	#   	"https://www.google.com/calendar/render?action=TEMPLATE&text=#{url_encode(event.name)}&dates=event.start_date/event.start_date&details=#{url_encode(event.website)}&location=#{url_encode(event.city.name)}&sf=true&output=xml"	
	# end
end

#https://calendar.google.com/calendar/render?action=TEMPLATE&trp=false&text=Event+Nummer+3&location=Dresden&details&dates=20151122T215600+0100/20151126T225400+0100&pli=1&sf=true&output=xml#main_7