class User < ActiveRecord::Base
	# duplicate email prevention step
	before_save { self.email = email.downcase }

	# validating name
	validates :name_first, presence: true, length: {maximum: 50}
	validates :name_last, presence: true, length: {maximum: 50}

	# validates email presence, format and uniqueness
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
					  uniqueness: {case_sensitive: false} 

	# validate password
	# passwords should be at least 8 characters
	validates :password, length: {minimum: 8}
	has_secure_password

  	serialize :friends

  	# each user has many posts, creates each users' personalized news feed
  	has_many :posts
end
