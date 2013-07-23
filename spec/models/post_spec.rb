require 'spec_helper'

describe Post do
  it { should have_db_column :title }
  it { should have_db_column :user_id }
  it { should have_db_column :created_at } 
  it { should have_db_column :updated_at }
  it { should have_db_column :version }
  it { should have_db_column :contents }
  it { should validate_presence_of :title }
  it { should validate_presence_of :contents }
  it { should belong_to :forum }
  it { should belong_to :user }
end
