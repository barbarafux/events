class EventPolicy < ApplicationPolicy
	class Scope < Scope
		def resolve	
			if user
				user.events.where('start_date > ?', DateTime.now).order('start_date asc').group_by { |t| t.start_date.beginning_of_month}
			else
				Event.where('start_date > ?', DateTime.now).order('start_date asc').group_by { |t| t.start_date.beginning_of_month}
			end
		end
	end

	def edit?
		user == record.user || user.admin
	end

	def update?
		edit?
	end

	def destroy?
		#user.admin
		user && user.admin
	end


end