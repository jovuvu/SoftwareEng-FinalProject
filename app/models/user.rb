class User < ActiveRecord::Base
	validates :name_first, presence: true, length: {maximum: 50}
	validates :name_last, presence: true, length: {maximum: 50}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
					  uniqueness: {case_sensitive: false} 

  	serialize :friends
  	has_many :posts
end
