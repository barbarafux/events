class Event < ActiveRecord::Base
	belongs_to :city

	validates_presence_of :name, :start_date

	validates_format_of :website,
		:allow_blank => true,
		:with => URI::regexp(%w(http https))

end