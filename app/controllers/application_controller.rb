class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_unless_admin
	  authenticate_or_request_with_http_basic do |username, password|
	    username == ENV['LEIGHUSERNAME'] && password == ENV['LEIGHPASSWORD']
	  end
  end
end
