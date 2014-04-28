class Relationship < ActiveRecord::Base
	def confirm
    	@relationship.confirmed = true
  	end
end
