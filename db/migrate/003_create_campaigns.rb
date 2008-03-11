class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name, :null=>false
      t.integer :user_id, :system_id, :null=>false
      t.boolean :public, :null=>false, :default=>false
      t.timestamps
      t.integer :version, :null=>false, :default=>1
    end
  end

  def self.down
    drop_table :campaigns
  end
end
