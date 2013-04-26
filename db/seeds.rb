# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


profiles = Profile.create(:gender => 'male', :sport => "soccer", :working_zip_code => '95628', :bio "ex-pro and collegiate all-american", :user_id => '1')