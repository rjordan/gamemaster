class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :name, :null => false
      t.integer :campaign_id, :null => false
      t.boolean :revealed, :null => false, :default => false
      t.text :public_description, :null => false
      t.text :private_description
      t.timestamps
      t.integer :version, :null => false, :default => 1
    end
    add_index :stories, :campaign_id

    create_table :chapters do |t|
      t.string :name, :null => false
      t.integer :story_id, :null => false
      t.integer :position, :default => 1
      t.boolean :revealed, :null => false, :default => false
      t.text :public_description, :null => false
      t.text :private_description
      t.timestamps
      t.integer :version, :null => false, :default => 1
    end
    add_index :chapters, :story_id

  end

  def self.down
    drop_table :chapters
    drop_table :stories
  end
end
