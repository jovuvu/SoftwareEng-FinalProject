class User < ActiveRecord::Base
	# validates :name_first, presence: true

  	serialize :friends
  	has_many :posts
end
