require 'rails_helper'

RSpec.describe "SessionsHelper", type: :helper do
  include SessionsHelper
  describe "test sessions helper" do
      
    before do
      @user = FactoryBot.create(:user, name: "Example User", email: "user@example.com",
                                password: "foobar", password_confirmation: "foobar")
      remember(@user)
    end
  
    specify "current_user returns right user when session is nil" do
      expect(@user).to eq current_user
    end
  
    specify "current_user returns nil when remember digest is wrong" do
      @user.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to be nil
    end
  end
end