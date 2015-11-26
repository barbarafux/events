class User < ActiveRecord::Base
	
	before_save { self.email = email.downcase }

	## VALIDATIONS
	validates_presence_of :email, :password

	##  EMAIL
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_format_of :email, 
                 	    :with => VALID_EMAIL_REGEX,
                 	    length: { maximum: 255 },
                 	    uniqueness: { case_sensitive: false }

    ## PASSWORD
    has_secure_password
    validates :password, length: { minimum: 8 }

end
