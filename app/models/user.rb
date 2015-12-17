class User < ActiveRecord::Base
	has_secure_password
	has_many :events

	validates :email,
				  presence: true,
				  uniqueness: {
				  				case_sensitive: false
				  			  },
				  format: {
				  			with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
				  		   }
    
    validates :password,
    		  	length: { minimum: 4 }

  def is_admin
    self.admin
  end

end