class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  
  # CanCan does not yet support rails 4 strong_parameters
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Whoops! You don't have permission to access this."
    redirect_to lessons_url
  end
  
  private
    def not_authenticated
      redirect_to login_url, :alert => "First log in to view this page."
    end
end
