class Post < ActiveRecord::Base
  serialize :children
end
