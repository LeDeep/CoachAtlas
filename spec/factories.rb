FactoryGirl.define do

  factory :user do 
    name 'Bill'
    sequence(:email) { |n| "abc#{n}@gmail.com" }
    # password "fooAAnnn$$54"
    # password_confirmation 'fooAAnnn$$54'
    status '1'

    factory :user_with_profile do 
      after(:create) do |user, evaluator|
        FactoryGirl.create(:profile, user: user)
      end
    end
  
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