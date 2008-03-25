class CreateChapters < ActiveRecord::Migration
  def self.up
    
    add_column :stories, :position, :integer, :null=>false, :default=>1
    
    create_table :chapters do |t|
      t.string :name, :null=>false
      t.integer :story_id, :null=>false
      t.integer :position, :null=>false, :default=>1
      t.text :public_description, :null=>false
      t.text :private_description
      t.boolean :public, :null=>false, :default=>false
      t.timestamps
      t.integer :version, :null=>false, :default=>1
    end
  end

  def self.down
    drop_table :chapters
    drop_column :stories, :position
  end
end
