FactoryGirl.define do

  factory :user do 
    sequence(:email) { |n| "abc#{n}@gmail.com" }
    password 'abc1234'
    password_confirmation 'abc1234'
    status '1'
  end

  factory :profile do 
    gender 'male'
    sport 'Basketball'
    working_zip_code '95811'
    bio 'I am a basketball coach'
    user_id 1
  end
end