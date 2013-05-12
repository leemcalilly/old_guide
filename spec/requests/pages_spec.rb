require 'spec_helper'

describe "Pages" do
  describe "GET /" do
    it "displays the homepage" do
      get root_path
      response.status.should be(200)
    end
  end
end
