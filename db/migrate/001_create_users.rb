class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :password_hash, :nickname, :null=>false
      t.timestamps
      t.integer :version, :null=>false, :default=>1
    end
  end

  def self.down
    drop_table :users
  end
end
