FactoryGirl.define do
  factory :story do
    name { Faker::Lorem.words(2).join(' ') }
    campaign
    public_description { Faker::Lorem.paragraphs(2).join('/n') }
    private_description { Faker::Lorem.paragraphs(2).join('/n') }
  end
end