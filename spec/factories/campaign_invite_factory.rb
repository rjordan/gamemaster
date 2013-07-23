FactoryGirl.define do
  factory :campaign_invite do
    campaign
    email 'bob2@nowhere.com'
  end
end
