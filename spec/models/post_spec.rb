require 'spec_helper'

describe Post, type: :model do
  it { expect(subject).to have_db_column :title }
  it { expect(subject).to have_db_column :user_id }
  it { expect(subject).to have_db_column :created_at }
  it { expect(subject).to have_db_column :updated_at }
  it { expect(subject).to have_db_column :version }
  it { expect(subject).to have_db_column :contents }
  it { expect(subject).to validate_presence_of :title }
  it { expect(subject).to validate_presence_of :contents }
  it { expect(subject).to belong_to :forum }
  it { expect(subject).to belong_to :user }
end
