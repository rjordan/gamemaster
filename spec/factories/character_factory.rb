FactoryGirl.define do
  factory :character do
    campaign
    user
    name { Faker::Lorem.words(2).join(' ') }
    public_description { Faker::Lorem.paragraph }
    statistics { Faker::Lorem.paragraph }
  end
end
