FactoryGirl.define do
  factory :campaign_invite do
    campaign
    email { Faker::Internet.email }
  end
end
