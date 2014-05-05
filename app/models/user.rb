class User < ActiveRecord::Base
	# duplicate email prevention step
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	# validating name
	validates :name_first, presence: true, length: {maximum: 50}
	validates :name_last, presence: true, length: {maximum: 50}

	# validates email presence, format and uniqueness
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
					  uniqueness: {case_sensitive: false} 

	# validate password
	# passwords should be at least 8 characters
	# validates :password, length: {minimum: 8}
	has_secure_password

  	# serialize :friends

  	# each user has many posts, creates each users' personalized news feed

  	has_many :posts, :source => :author
  	
  	has_many :relationships, :foreign_key => "requesting_user_id"
  	
  	has_many  :confirmed_friends, 
  	          :through => :relationships, 
  	          :conditions => {"relationships.status" => "Confirmed"},
  	          :source => :friend
    has_many  :pending_friends, 
              :through => :relationships, 
              :conditions => {"relationships.status" => "Pending"},
              :source => :friend
    has_many  :friend_requests, 
              :through => :relationships, 
              :conditions => {"relationships.status" => "Requested"},
              :source => :friend
              
    has_many  :friends,
              :source => :friend,
              :through => :relationships do
                def status(crit)
                  where("relationships.status = ?", crit)
                end
              end
              
    has_many  :friend_posts, -> {where(relationships: {status: "Confirmed"})},
              :through => :relationships, 
              :source => :posts
              
  	def User.new_remember_token
  		SecureRandom.urlsafe_base64
  	end

  	def User.digest(token)
  		Digest::SHA1.hexdigest(token.to_s)
  	end




  	private
  		def create_remember_token
  			self.remember_token = User.digest(User.new_remember_token)
  		end


end
