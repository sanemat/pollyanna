class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authenticate
      if Rails.env.production?
        authenticate_or_request_with_http_basic('Enter Password') do |u, p|
          u == ENV['USER_EDITABLE'] && p == ENV['PASSWORD_EDITABLE']
        end
      end
    end

end
