class CreateCharacters < ActiveRecord::Migration
  def self.up

    create_table :characters do |t|
      t.string :name, :null => false
      t.integer :campaign_id, :null => false
      t.integer :user_id, :null => true
      t.text :public_description, :statistics, :null => false
      t.text :private_description
      t.timestamps
      t.integer :version, :null => false, :default => 1
    end
    add_index :characters, :campaign_id
    add_index :characters, :user_id

  end

  def self.down
    drop_table :characters
  end
end
