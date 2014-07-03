require 'spec_helper'

describe User, type: :model do
  #Schema
  it { expect(subject).to have_db_column :email }
  it { expect(subject).to have_db_column :nickname }

  #Associations
  it { expect(subject).to have_many :campaigns }
  it { expect(subject).to have_many :games }

  #Validations
  it { expect(subject).to validate_presence_of :email }
  it { expect(subject).to validate_presence_of :nickname }
  #it { expect(subject).to validate_uniqueness_of :email }
  #it { expect(subject).to validate_uniqueness_of :nickname }
end
