require 'spec_helper'

describe "Footer" do
  describe "public" do
    it "should have the right content" do
      visit '/'
      within("#footer") do
        page.should have_content("©")
        page.should have_content(Time.now.year)
        page.should have_link("Original Fuzz")
      end
    end
  end

  describe "student" do
    it "should have the right content" do
      signup_and_login
      visit '/lessons'
      within("#footer") do
        page.should have_content("©")
        page.should have_content(Time.now.year)
        page.should have_link("Original Fuzz")
      end
    end
  end
  
  describe "admin" do
    it "should have the right content" do
      signup_and_login_admin
      visit '/photos'
      within("#footer") do
        page.should have_content("©")
        page.should have_content(Time.now.year)
        page.should have_link("Original Fuzz")
      end
    end
  end
end