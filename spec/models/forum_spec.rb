require 'spec_helper'

describe Forum do
  it { expect(subject).to have_db_column :name }
  it { expect(subject).to have_db_column :campaign_id }
  it { expect(subject).to have_db_column :public }
  it { expect(subject).to have_db_column :created_at }
  it { expect(subject).to have_db_column :updated_at }
  it { expect(subject).to have_db_column :version }
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to belong_to :campaign }
  it { expect(subject).to have_many :posts }
  #subscribers?
end
