module EventsHelper

	def error_message(model, attribute)
		if model.errors[attribute].present?
			model.errors[attribute].first
		end
	end

	def friendly_date(date_to_convert)
		date_to_convert.strftime('%d. %B %Y')
	end

end
