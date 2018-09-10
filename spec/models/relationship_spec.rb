require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @users = FactoryBot.create_list(:user, 3)
    @relationship = FactoryBot.create(:relationship)
  end
  
  it "should be valid" do
    expect(@relationship).to be_valid
  end
end
