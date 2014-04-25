class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.text :children
      t.string :parent
      t.string :user_id
      t.timestamps
    end
  end
end
