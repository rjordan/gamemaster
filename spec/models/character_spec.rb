require 'spec_helper'

describe Character do
  it { should have_db_column :name }
  it { should have_db_column :campaign_id }
  it { should have_db_column :statistics }
  it { should have_db_column :public_description }
  it { should have_db_column :private_description }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }
  it { should have_db_column :version }
  it { should have_db_column :user_id }
  it { should validate_presence_of :name }
  it { should validate_presence_of :campaign_id }
  it { should validate_presence_of :public_description }
  it { should validate_presence_of :statistics }
  it { should belong_to :campaign }
  it { should belong_to :user }
end
