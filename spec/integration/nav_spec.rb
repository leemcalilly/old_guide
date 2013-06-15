require 'spec_helper'

describe "Main nav" do
  describe 'Logged In' do
    it "should have the right links in the main nav" do
      visit "/"
      within('#main_nav') do
        page.should have_link('Home')
        page.should have_link('Lessons')
      end
    end
  end
end