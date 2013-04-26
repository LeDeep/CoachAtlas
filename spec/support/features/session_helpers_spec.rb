def sign_up_with(name, email, password)
  visit root_path
  click_link 'Create an Account'
  within(".new_user_form") do
    fill_in 'name', with: name
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password
    click_button 'Register'
  end
end

def sign_in #JAVASCRIPT could be tripping up the capybara testing????????????
  sign_up_with('bob jones', 'email@email.com', 'secret')
  visit root_path
  page.find('Sign in').click
  within('.sign_in_form') do 
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'secret123'
  end
  click_button 'Login'
end
