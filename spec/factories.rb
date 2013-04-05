FactoryGirl.define do

  factory :user do 
    sequence(:email) { |n| "abc#{n}@gmail.com" }
    status '1'
  end

  factory :profile do 
    gender 'male'
    sport 'Basketball'
    working_zip_code '95811'
    bio 'I am a basketball coach'
    user_id 1
  end

  factory :job do 
    listing_title 'Soccer training'
    sport 'Soccer'
    gender 'female'
    city 'Sacramento'
    state 'CA'
    zip_code '95383'
    description 'Coach for girls high-school soccer training'
    user_id 1
  end

  factory :contact_detail do 
    first_name 'Peter'
    last_name 'Lowry'
    phone '916-484-4894'
    email 'peter@coachatlas.com'
    address '111 main street'
    city 'Sacramento'
    state 'CA'
    zip_code '58585'
    user_id 1
  end

end