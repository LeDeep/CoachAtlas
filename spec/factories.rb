FactoryGirl.define do

  factory :user do 
    sequence(:email) { |n| "abc#{n}@gmail.com" }
    password 'abc1234'
    password_confirmation 'abc1234'
  end

  factory :profile do 
    first_name 'John'
    last_name 'Doe'
    gender 'male'
    sport 'Basketball'
    location 'Folsom, CA'
    contact_email 'jdoe@gmail.com'
    bio 'I am a basketball coach'
    user_id 1
  end
end