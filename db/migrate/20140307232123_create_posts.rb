class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string 'posted_by'
      t.datetime 'post_date'
      t.text 'post_text'
      t.string 'parent'
      t.text 'children'
      t.timestamps
    end
  end
end
