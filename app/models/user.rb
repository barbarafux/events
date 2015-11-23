class User < ActiveRecord::Base
	validates_presence_of :email, :password

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_format_of :email, length: { maximum: 255 },
                 	    format: { with: VALID_EMAIL_REGEX },
                 	    uniqueness: { case_sensitive: false }

end
