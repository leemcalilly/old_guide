class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Whoops! You don't have permission to access this."
    redirect_to lessons_url
  end
  
  private
    def not_authenticated
      redirect_to login_url, :alert => "First log in to view this page."
    end
end
