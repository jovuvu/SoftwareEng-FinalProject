class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "name"
      t.string "email"
      t.datetime "dob"
      t.string "gender"
      t.string "hashed_password"
      t.text "interests"
      t.string "quotes"
      t.string "tvshowsAndmovies"
      t.string "music"
      t.text "friends"
      t.timestamps
    end
  end
end
