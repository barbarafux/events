class User < ActiveRecord::Base

	# VALIDATIONS

	##  EMAIL
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: { case_sensitive: false }

    ## PASSWORD
    has_secure_password
    validates :password, length: { minimum: 4 }

end
