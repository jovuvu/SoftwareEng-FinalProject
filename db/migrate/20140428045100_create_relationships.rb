class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.integer :requesting_user_id
    	t.integer :receiving_user_id
    	t.boolean :confirmed

    	t.timestamps
    end
  end
end
