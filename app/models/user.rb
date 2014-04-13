class User < ActiveRecord::Base
	validates :name_first, presence: true
	validates :name_last, presence: true
	validates :email, presence: true

  	serialize :friends
  	has_many :posts
end
