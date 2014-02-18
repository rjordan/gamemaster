FactoryGirl.define do
  factory :user do
    nickname { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'password1'
    confirmation_sent_at { 10.minutes.ago }
    confirmation_token 'v_2MCqdxyNEvZ_yn9CqJ'
    confirmed_at { DateTime.now }
  end
end
