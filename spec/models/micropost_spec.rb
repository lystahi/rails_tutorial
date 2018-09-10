require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end
  
  it "should be valid" do
    expect(@micropost).to be_valid
  end
  
  specify "user id should be present" do
    @micropost.user_id = nil
    expect(@micropost).to_not be_valid
  end
  
  specify "content should be present" do
    @micropost.content = "   "
    expect(@micropost).to_not be_valid
  end
  
  specify "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    expect(@micropost).to_not be_valid
  end
end
