require 'spec_helper'

feature "creating an account" do 
  scenario 'valid user info' do
    sign_up_with('bob jones', 'email@email.com', 'secret123')
    page.should have_content "Signed in!"
  end
end

feature "logging in", :js => true do 
  scenario 'valid user info' do
    sign_in
    page.should have_content "Signed in!"
  end
end

feature "logging out" do 
  scenario 'signed in' do
    sign_in
    click_on 'Logout'
    page.should have_content "Logged Out!"
  end
end