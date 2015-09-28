require 'rails_helper'

describe SystemSerializer do
  it { expect_valid_serialized_model(:system) }
end
