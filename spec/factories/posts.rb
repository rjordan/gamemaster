FactoryGirl.define do
  factory :post do
    user
    forum
    title { Faker::Lorem.sentence }
    contents { Faker::Lorem.paragraph }
  end
end
