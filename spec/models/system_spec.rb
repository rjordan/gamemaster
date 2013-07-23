require 'spec_helper'

describe System do
  it { should have_db_column :name }
  it { should validate_presence_of :name }
  it { should have_many :campaigns }
end
