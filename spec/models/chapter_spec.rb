require 'spec_helper'

describe Chapter do
  it { expect(subject).to have_db_column :name }
  it { expect(subject).to have_db_column :story_id }
  it { expect(subject).to have_db_column :revealed }
  it { expect(subject).to have_db_column :public_description }
  it { expect(subject).to have_db_column :private_description }
  it { expect(subject).to have_db_column :created_at }
  it { expect(subject).to have_db_column :updated_at }
  it { expect(subject).to have_db_column :version }
  it { expect(subject).to have_db_column :position }
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :story_id }
  it { expect(subject).to validate_presence_of :public_description }
  it { expect(subject).to validate_presence_of :position }
  it { expect(subject).to belong_to :story }
end
