require 'spec_helper'

describe "Logged in abilities" do
  
  it "denies non-logged in users access to lessons" do
    visit '/lessons'
    within("div.alert.alert-error") do
      page.should have_content("First log in to view this page.")
    end
  end
  
end