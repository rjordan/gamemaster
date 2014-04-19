require 'spec_helper'

describe System do
  it { expect(subject).to have_db_column :name }

  it { expect(subject).to have_many :campaigns }

  it { expect(subject).to validate_presence_of :name }
end
