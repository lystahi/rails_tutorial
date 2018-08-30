require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  
  render_views
  
  describe "#Root" do
    it "responds successfully" do
      expect(get: "/").to route_to(controller: "static_pages", action: "home")
    end
  end
  
  
  describe "#Home" do
    it "responds successfully" do
      get :home
      expect(response).to be_success
      assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
    end
  end
  
  describe "#Help" do
    it "responds successfully" do
      get :help
      expect(response).to be_success
      assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
    end
  end
  
  describe "#About" do
    it "responds successfully" do
      get :about
      expect(response).to be_success
      assert_select "title", "About | Ruby on Rails Tutorial Sample App"
    end
  end  
  
  describe "#Contact" do
    it "responds successfully" do
      get :contact
      expect(response).to be_success
      assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
    end
  end    
end
