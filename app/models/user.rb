class User < ActiveRecord::Base
  serialize :friends

  
end
