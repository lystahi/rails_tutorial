require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user, name: "Example User", email: "user@example.com",
                              password: "foobar", password_confirmation: "foobar")
  end
  
  it "has a valid user" do
    @user.valid?
    expect(@user).to be_valid
  end
  
  it "can't be valid without a name" do
    @user.name = ""
    expect(@user).to_not be_valid
  end
  
  it "can't be valid without a email" do
    @user.email = ""
    expect(@user).to_not be_valid
  end
  
  it "has a maximum length of name 50" do
    @user.name = "a" * 51
    expect(@user).to_not be_valid
  end
  
  it "has a maximum length of email 255" do
    @user.email = "a" * 244 + "@example.com"
    expect(@user).to_not be_valid
  end

  it "accepts valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end
  
  it "rejects invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it "has an unique email address" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase    
    @user.save
    expect(duplicate_user).to_not be_valid
  end
  
  it "saves email addresses as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq(@user.reload.email)
  end  

  it "has a password which is present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to_not be_valid
  end

  it "has a password which have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user).to_not be_valid
  end
  
end
