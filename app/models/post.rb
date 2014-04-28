class Post < ActiveRecord::Base
  serialize :children, Array
  belongs_to :author, class_name: "User", foreign_key: "user_id"
end
