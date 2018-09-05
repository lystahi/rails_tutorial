require 'rails_helper'

RSpec.feature "UsersLogin", type: :feature do
  scenario "a flash message shows up with invalid user information" do
    visit login_path
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"
    expect(page).to have_content "Invalid email/password combination"
    visit root_path
    expect(page).to_not have_content "Invalid email/password combination"
  end
  
  scenario "user can log in and log out with valid information" do
    @user = create(:user)
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_button "Log in"
    expect(page).to have_content @user.name
    expect(page).to have_content("Log out")    
    click_link "Log out"
    expect(page).to have_content("Welcome to the Sample App")     
  end
  
end
