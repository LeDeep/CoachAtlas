FactoryGirl.define do

  factory :user do 
    sequence(:email) { |n| "abc#{n}@gmail.com" }
    password 'abc1234'
    password_confirmation 'abc1234'
  end
end