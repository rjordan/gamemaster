FactoryGirl.define do
  factory :forum do
    name { Faker::Lorem.words(2).join(' ') }
    public { true }
  end
end