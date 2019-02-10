class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :follower_id
      t.integer :following_id

      t.timestamps null: false
    end
	    add_index :follows, :follower_id
	    add_index :follows, :following_id
	    add_index :follows, [:follower_id, :following_id], unique: true
  end
end
