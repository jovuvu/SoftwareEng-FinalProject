class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :friend_id
      t.boolean :pending?
      

      t.timestamps
    end
    add_index :relationships, :friend_id
  end
end
