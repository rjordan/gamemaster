require 'spec_helper'

describe User do
  #Schema
  it { should have_db_column :email }
  it { should have_db_column :nickname }

  #Associations
  it { should have_many :campaigns }
  it { should have_many :games }

  #Validations
  it { should validate_presence_of :email }
  it { should validate_presence_of :nickname }
  #it { should validate_uniqueness_of :email }
  #it { should validate_uniqueness_of :nickname }
end
