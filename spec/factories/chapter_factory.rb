FactoryGirl.define do
  factory :chapter do
    story
    position { 1 }
    name { Faker::Lorem.words(2).join(' ') }
    public_description { Faker::Lorem.paragraph }
  end
end
