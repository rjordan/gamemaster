require 'spec_helper'

describe Chapter do
    it { should have_db_column :name }
    it { should have_db_column :story_id } 
    it { should have_db_column :revealed }
    it { should have_db_column :public_description } 
    it { should have_db_column :private_description }
    it { should have_db_column :created_at }
    it { should have_db_column :updated_at }
    it { should have_db_column :version }
    it { should have_db_column :position }
    it { should validate_presence_of :name }
    it { should validate_presence_of :story_id } 
    it { should validate_presence_of :public_description }
    it { should validate_presence_of :position }
    it { should belong_to :story }
end
