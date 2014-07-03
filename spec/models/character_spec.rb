require 'spec_helper'

describe Character, type: :model do
  it { expect(subject).to have_db_column :name }
  it { expect(subject).to have_db_column :campaign_id }
  it { expect(subject).to have_db_column :statistics }
  it { expect(subject).to have_db_column :public_description }
  it { expect(subject).to have_db_column :private_description }
  it { expect(subject).to have_db_column :created_at }
  it { expect(subject).to have_db_column :updated_at }
  it { expect(subject).to have_db_column :version }
  it { expect(subject).to have_db_column :user_id }

  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :public_description }
  it { expect(subject).to validate_presence_of :statistics }

  it { expect(subject).to belong_to :campaign }
  it { expect(subject).to belong_to :user }
end
