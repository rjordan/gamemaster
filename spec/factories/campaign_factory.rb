FactoryGirl.define do
  factory :campaign do
    name 'Scorched Earth'
    user
    system
    public { false }
    max_players 5
    description 'My Exalted campaign'
  end
end
