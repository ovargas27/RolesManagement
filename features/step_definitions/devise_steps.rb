def current_user
  @current_user
end

Given /^I am not authenticated$/ do
  visit destroy_user_session_path # '/users/sign_out'
end

Given /^I am a new, authenticated user$/ do
  email = 'foo@example.com'
  password = 'secretpass'
  @current_user = User.new(:email => email, :password => password, :password_confirmation => password)
  @current_user.save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"

end
