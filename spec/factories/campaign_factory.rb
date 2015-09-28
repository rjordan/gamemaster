FactoryGirl.define do
  factory :campaign do
    name { Faker::Lorem.words(2).join(' ') }
    user
    system
    public false
    max_players 6
    description { Faker::Lorem.paragraphs(2).join('/n') }
  end
end
