require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do
  describe "GET root" do
    it "responses status code 200" do
      get root_path
      expect(response).to have_http_status(200)
    end
    
    it "has links" do
      get root_path
      assert_template 'static_pages/home'
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", help_path
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path
      assert_select "a[href=?]", signup_path
    end
  end
end
