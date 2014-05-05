class Relationship < ActiveRecord::Base

  scope :confirmed, -> {where(status: "Confirmed")}
  scope :pending, -> {where(status: "Pending")}
  scope :requested, -> {where(status: "Requested")}
  
  belongs_to :user, foreign_key: "requesting_user_id"
  belongs_to :friend, class_name: "User", foreign_key: "receiving_user_id"
  has_many :posts, :through => :friend
 end