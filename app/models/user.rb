class User < ActiveRecord::Base
  serialize :friends
  has_many :posts
end
