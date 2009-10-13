class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nickname, :null=>false
      t.string :email, :null=>false
      t.string :password_hash, :null=>false
      t.string :password_salt
      t.integer :failed_login_count, :null => false, :default => 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :openid_identifier
      t.string :persistence_token, :null => false
      t.timestamps
      t.integer :version, :null=>false, :default=>1
    end
  end

  def self.down
    drop_table :users
  end
end
