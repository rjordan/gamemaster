require 'spec_helper'

describe User do
  it { should have_db_column :email }
  it { should have_db_column :nickname }
  it { should validate_presence_of :email } 
  it { should validate_presence_of :nickname }
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of(:nickname) }
  it { should have_many :campaigns }
  it { should have_many :games }
end
