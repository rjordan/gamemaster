class CreateForums < ActiveRecord::Migration
  def self.up

    create_table :forums do |t|
      t.string :name, :null => false
      t.integer :campaign_id, :null => true
      t.boolean :public, :default => true, :null => false
      t.timestamps
      t.integer :version, :null => false, :default => 1
    end
    add_index :forums, :campaign_id

    create_table :posts do |t|
      t.integer :forum_id, :null => false
      t.string :title, :null => false
      t.integer :user_id, :null => false
      t.text :contents, :null => false
      t.timestamps
      t.integer :version, :null => false, :default => 1
    end
    add_index :posts, :forum_id
    add_index :posts, :user_id

    create_table :forum_users do |t|
      t.integer :forum_id, :null => false
      t.integer :user_id, :null => false
      t.boolean :moderator, :null => false, :default => false
      t.timestamps
    end
    add_index :forum_users, [:forum_id, :user_id], :unique => true

  end

  def self.down
    drop_table :posts
    drop_table :forum_users
    drop_table :forums
  end
end
