require 'rails_helper'

describe System, type: :model do
  it { expect(subject).to have_db_column :name }
  it { expect(subject).to have_many :campaigns }
  it { expect(subject).to validate_presence_of :name }
end
