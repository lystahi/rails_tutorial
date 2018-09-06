require 'rails_helper'

RSpec.feature "UsersIndex", type: :feature do
  scenario "it should redirect index when not logged in" do
    visit users_path
    expect(page).to have_content("Log in")
  end
  
  scenario "index includes pagination" do
    @user = create(:user)
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    check "session_remember_me"
    click_button "Log in"
    visit users_path
    expect(page).to have_content("All users")
    User.paginate(page: 1).each do |user|
      expect(page).to have_content(user.name)
    end
  end
end
