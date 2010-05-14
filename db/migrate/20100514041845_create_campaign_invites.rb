class CreateCampaignInvites < ActiveRecord::Migration
  def self.up
    create_table :campaign_invites do |t|
      t.integer :campaign_id, :null=>false
      t.string :email, :null=>false
      t.timestamps
    end
    add_index :campaign_invites, :campaign_id
  end

  def self.down
    drop_table :campaign_invites
  end
end
