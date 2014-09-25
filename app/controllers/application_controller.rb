class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  helper_method :current_user

  helper_method :is_signed_in?

  def authenticate
    unless ENV['HTTP_AUTH_USERNAME'].blank? or ENV['HTTP_AUTH_PASSWORD'].blank?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['HTTP_AUTH_USERNAME'] && password == ENV['HTTP_AUTH_PASSWORD']
      end
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def is_signed_in?
     current_user.present?
  end
end
