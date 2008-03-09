class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name, :null=>false
      t.integer :user_id, :system_id, :null=>false
    end
  end

  def self.down
    drop_table :campaigns
  end
end
