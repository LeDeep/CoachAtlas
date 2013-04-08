def sign_up_with(email, password)
  visit 'new_user_form'
  within("identities/new") do 
  click_link 'Create an account'
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password
  end
    click_button 'Register'
end

def sign_in
  user = create(:user)
  visit root_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Login'
end
