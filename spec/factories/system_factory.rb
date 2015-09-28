FactoryGirl.define do
  factory :system do
    name { Faker::Lorem.words(3).join(' ') }
  end
end
