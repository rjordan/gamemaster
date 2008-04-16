class CreateForums < ActiveRecord::Migration
  def self.up
    
    create_table :forums do |t|
      t.string :name, :null=>false
      t.integer :campaign_id, :null=>true
      t.boolean :public, :default=>true
      t.timestamps
      t.integer :version, :null=>false, :default=>1
    end
    
    create_table :posts do |t|
      t.string :title, :null=>false
      t.integer :forum_id, :null=>false
      t.integer :user_id, :null=>false
      t.timestamps
      t.integer :version, :null=>false, :default=>1
      t.text :contents, :null=>false
    end
  end

  def self.down
    drop_table :posts
    drop_table :forums
  end
end
