class Event < ActiveRecord::Base
	belongs_to :city

	validates_presence_of :name, :start_date, :city_id#, :spam_filter

	validates_format_of :website,
		:allow_blank => true,
		:with => URI::regexp(%w(http https))

	scope :today, lambda { where(start_date: Time.zone.now.all_day) }
	scope :past, lambda { where('start_date: <= ?', Date.today)}
	#scope :month, lambda { where(tbd) }
	#http://stackoverflow.com/questions/15710106/get-db-records-from-today-and-tomorrow-in-rails

	def self.search(search)
		joins(:city).where('lower(cities.name) LIKE ? or lower(events.name) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
		#joins(:city).where('cities.name LIKE ?', "%#{search.downcase}%")
	end

	mount_uploader :image, EventpicUploader

end