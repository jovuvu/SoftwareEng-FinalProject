class User < ActiveRecord::Base
  serialize :preferences
end
