require 'rails_helper'

RSpec.feature "UsersEdit", type: :feature do
  
  before do
    @user = create(:user)
    @other_user = create(:user)
  end
  
  scenario "invalid user can't edit user information" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    check "session_remember_me"
    click_button "Log in"
    visit edit_user_path(@user)
    expect(page).to have_content("Update your profile")
    fill_in "Name", with: ""
    fill_in "Email", with: "foo@invalid"
    fill_in "Password", with: "foo"
    fill_in "Confirmation", with: "bar"
    click_button("Save changes")
    expect(page).to have_content("Update your profile")
  end
  
  scenario "valid user can edit user information" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    check "session_remember_me"
    click_button "Log in"    
    visit edit_user_path(@user)
    expect(page).to have_content("Update your profile")    
    name  = "Foo Bar"
    email = "foo@bar.com"
    fill_in "Name", with: name
    fill_in "Email", with: email
    click_button("Save changes")
    expect(page).to have_content("Profile updated")
    expect(page).to have_content(name)
    @user.reload
    expect(page).to have_content(@user.name)
  end
  
  describe "GET edit_user_path" do
    it "should redirect edit when not logged in" do
      visit edit_user_path(@user)
      expect(page).to have_content("Please log in")
      expect(page).to have_content("Log in")      
    end
  end
  
  scenario "it should redirect edit when logged in as wrong user" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    check "session_remember_me"
    click_button "Log in"    
    visit edit_user_path(@other_user)
    expect(page).to have_content("The Ruby on Rails Tutorial by Michael Hartl")
  end
  
  scenario "successful edit with friendly forwarding" do
    visit edit_user_path(@user)
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    check "session_remember_me"
    click_button "Log in"    
    expect(page).to have_content("Update your profile")
  end
end