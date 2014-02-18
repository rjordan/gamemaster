class CreateCampaignResources < ActiveRecord::Migration
  def self.up
    create_table :campaign_resources do |t|
      t.string :name, :null => false
      t.integer :campaign_id, :null => false
      t.integer :parent_id, :null => true #Is this a sub-location?
      t.string :resource_type, :null => false #Actor/Location/Item
      t.boolean :public, :null => false, :default => false
      t.text :public_description, :null => false
      t.text :private_description
      t.timestamps
      t.integer :version, :null => false, :default => 1
    end
    add_index :campaign_resources, :campaign_id
  end

  def self.down
    drop_table :campaign_resources
  end
end
