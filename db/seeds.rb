# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
            {
              :name_first => 'Jonathan',
              :name_last => 'Vu', 
              :email => 'jonathan.vu@colorado.edu', 
              :dob => '4-Nov-1988', 
              :gender => 'Male', 
              :password => 'jonathanvu', 
              :password_confirmation => 'jonathanvu', 
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
              :password => 'bobross', 
              :password_confirmation => 'bobross', 
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
              :password => 'billyjean', 
              :password_confirmation => 'billyjean', 
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