class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :name, :null=>false
      t.integer :campaign_id, :null=>false
      t.text :public_description, :null=>false
      t.text :private_description
      t.boolean :public, :null=>false, :default=>false
      t.timestamps
      t.integer :version, :null=>false, :default=>1
    end
  end

  def self.down
    drop_table :stories
  end
end
