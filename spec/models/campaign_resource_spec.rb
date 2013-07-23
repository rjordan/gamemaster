require 'spec_helper'

describe CampaignResource do
  it { should have_db_column :name }
  it { should have_db_column :campaign_id }
  it { should have_db_column :public_description } 
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }
  it { should have_db_column :version }
  it { should have_db_column :parent_id }
  it { should have_db_column :public }
  it { should validate_presence_of :name }
  it { should validate_presence_of :campaign_id }
  it { should validate_presence_of :public_description }
  it { should belong_to :campaign } #, :parent
end
