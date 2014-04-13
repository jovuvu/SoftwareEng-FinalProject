class User < ActiveRecord::Base
	validates :name_first, presence: true, length: {maximum: 50}
	validates :name_last, presence: true, length: {maximum: 50}
	validates :email, presence: true

  	serialize :friends
  	has_many :posts
end
