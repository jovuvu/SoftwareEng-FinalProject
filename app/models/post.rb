class Post < ActiveRecord::Base
  serialize :children
  belongs_to :user
end
