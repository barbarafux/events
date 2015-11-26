class Event < ActiveRecord::Base
	belongs_to :city

	validates_presence_of :name, :start_date

	validates_format_of :website,
		:allow_blank => true,
		:with => URI::regexp(%w(http https))

	scope :today, lambda { where(start_date: Time.zone.now.all_day) }
	scope :past, lambda { where('start_date: <= ?', Date.today)}
	#scope :month, lambda { where(tbd) }
	#http://stackoverflow.com/questions/15710106/get-db-records-from-today-and-tomorrow-in-rails

	def self.search(search)
			where('lower(name) LIKE ?', "%#{search.to_s.downcase}%") 
	end

end