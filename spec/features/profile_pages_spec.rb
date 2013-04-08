require 'spec_helper'

# feature "creating a profile" do
#   scenario 'siging in and creating a profile' do
#     sign_in
#     click_link "Create a Profile"
#     fill_in "Sport", :with => 'soccer'
#     fill_in "Gender", :with => 'male'
#     fill_in "Bio", :with => 'i coach soccer'
#     fill_in "Working zip code", :with => '61545'
#     click_button "Create Profile"
#     current_path.should eq(new_contact_detail_path)
#     page.should have_content("Your profile has been created.")
#     Profile.last.should include(user.profile)
#   end
# end   