class Post < ActiveRecord::Base
  serialize :children, Array
  
end
