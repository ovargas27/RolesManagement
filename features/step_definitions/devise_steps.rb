Given /^I am not authenticated$/ do
  visit destroy_user_session_path # '/users/sign_out'
end

Given /^I am a new, authenticated user$/ do
  email = 'foo@example.com'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"

end
