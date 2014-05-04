class Relationship < ActiveRecord::Base
	def confirm
    	@relationship.confirmed = true
  end
  belongs_to :user, foreign_key: "requesting_user_id"
  belongs_to :friend, class_name: "User", foreign_key: "receiving_user_id"
end
