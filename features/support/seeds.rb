# This file is a copy of seeds.rb from db/migrate/seeds.rb. It is here to be used with some
# cucumber tests. Check features/support/env.rb.

users = [
            {
              :name_first => 'Jonathan',
              :name_last => 'Vu', 
              :email => 'jonathan.vu@colorado.edu', 
              :dob => '4-Nov-1988', 
              :gender => 'Male', 
              :password_hash => 'jonathanvu', 
              :interests => 'nothing,something,anything,everything', 
              :quotes => 'hello world', 
              :tv_and_movies => 'a play', 
              :music => 'blahblah'
            },
            {
              :name_first => 'Bob',
              :name_last => 'Ross', 
              :email => 'Bob.Ross@colorado.edu', 
              :dob => '4-Nov-1920', 
              :gender => 'Male', 
              :password_hash => 'bobross', 
              :interests => 'nothing,something,anything,everything', 
              :quotes => 'hello world', 
              :tv_and_movies => 'a play', 
              :music => 'blahblah'
            },
            {
              :name_first => 'Billy',
              :name_last => 'Jean', 
              :email => 'billy.jean@colorado.edu', 
              :dob => '4-Nov-1988', 
              :gender => 'Male', 
              :password_hash => 'billyjean', 
              :interests => 'nothing,something,anything,everything', 
              :quotes => 'hello world', 
              :tv_and_movies => 'a play', 
              :music => 'blahblah'
            }
        ]
        
users.each do |user|
  User.create!(user)
end

@blah = User.all
@ids = Array.new
@blah.each do |user|
  @ids.push(user.id)
end

@blah.each do |user|
  user.friends = @ids
  user.save
end