require 'spec_helper'

describe ApplicationHelper do
  describe "full_title" do
    it "includes the page title" do
      expect(full_title("foo")).to match(/foo/)
    end

    it "includes the base title" do
      expect(full_title("foo")).to match(/^foo < The Fuzz Guide to Guitar/)
    end

    it "does not include a bar for the home page" do
      expect(full_title("")).not_to match(/\</)
    end
  end
  
  it "has the right app name" do
    app_name == "The Fuzz Guide to Guitar"
  end
  
  it "has the right app domain name" do
    app_domain == "fuzzguide.com"
  end
  
  it "has the right company name" do
    system_email == "Original Fuzz"
  end
  
  it "has the right company url" do
    company_url === "http://www.originalfuzz.com"
  end
  
  it "has the right system email" do
    system_email == "fuzzguide@gmail.com"
  end
end