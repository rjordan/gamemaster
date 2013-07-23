require 'spec_helper'

describe Forum do
  it { should have_db_column :name }
  it { should have_db_column :campaign_id }
  it { should have_db_column :public }
  it { should have_db_column :created_at } 
  it { should have_db_column :updated_at }
  it { should have_db_column :version }
  it { should validate_presence_of :name }
  it { should belong_to :campaign }
  it { should have_many :posts }
  #subscribers?
end
