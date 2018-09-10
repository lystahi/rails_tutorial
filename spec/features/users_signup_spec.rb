require 'rails_helper'

RSpec.feature "UsersSignup", type: :feature do
  scenario "user can't sign up with invalid information" do
    @user_count = User.count
    visit signup_path
    fill_in "Name", with: ""
    fill_in "Email", with: "user@invalid"
    fill_in "Password", with: "foo"
    fill_in "Confirmation", with: "bar"
    click_button "Create my account"
    expect(User.count).to eq @user_count
  end
  
  scenario "user can sign up with valid information" do
    @user_count = User.count
    visit signup_path
    fill_in "Name", with: "Example User"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"
    click_button "Create my account"
    expect(User.count).to eq @user_count + 1
    #expect(page).to have_content("Welcome to the Sample App!")
    #expect(page).to have_content("Log out")    
  end    
end
