class PagesController < ApplicationController
  def home
  end
  
  def about
    @page_title = "About Us"
  end
end
