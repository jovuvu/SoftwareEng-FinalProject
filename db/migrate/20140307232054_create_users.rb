class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 'name_first'
      t.string 'name_last'
      t.string 'email'
      t.datetime 'dob'
      t.string 'gender'
      t.string 'password_hash'
      t.text 'interests'
      t.text 'quotes'
      t.text 'tv_and_movies'
      t.text 'music'
      t.text 'friends'
      t.timestamps
    end
  end
end
