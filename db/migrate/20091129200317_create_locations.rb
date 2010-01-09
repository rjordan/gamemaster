class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name, :null=>false
      t.integer :campaign_id, :null=>false
      t.integer :parent_id, :null=>true #Is this a sub -location?
      t.text :public_description, :null=>false
      t.text :private_description
      t.timestamps
      t.integer :version, :null=>false, :default=>1
    end
  end

  def self.down
    drop_table :locations
  end
end
