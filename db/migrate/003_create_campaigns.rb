class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name, :null => false
      t.integer :user_id, :null => false #GameMaster
      t.integer :system_id, :null => false
      t.boolean :public, :null => false, :default => false
      t.text :description, :null => false
      t.integer :max_players, :null => false, :default => 5
      t.timestamps
      t.integer :version, :null => false, :default => 1
    end
    add_index :campaigns, :system_id
    add_index :campaigns, :public
    add_index :campaigns, :user_id

    create_table :campaigns_players, :id => false do |t|
      t.integer :campaign_id, :null => false
      t.integer :user_id, :null => false
      t.datetime :start_date, :end_date
    end
    add_index(:campaigns_players, [:campaign_id, :user_id], :unique => true)

    create_table :campaigns_invitations, :id => false do |t|
      t.integer :campaign_id, :null => false
      t.string :email, :null => false
      t.timestamps
    end
    add_index(:campaigns_invitations, [:campaign_id, :email], :unique => true)

  end

  def self.down
    drop_table :campaigns_invitations
    drop_table :campaigns_players
    drop_table :campaigns
  end
end
