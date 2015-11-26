module UsersHelper

	def error_message(model, attribute)
		if model.errors[attribute].present?
			model.errors[attribute].first
		end
	end

end
