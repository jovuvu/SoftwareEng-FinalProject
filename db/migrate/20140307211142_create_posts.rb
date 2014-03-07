class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer "postedBy"
      t.datetime "datePosted"
      t.text "content"
      t.integer "parentId"
      t.text "children"
      t.timestamps
    end
  end
end
S