class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :signed_in?

  before_action :authenticate_user

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticate_user
    redirect_to :sign_in unless signed_in?
  end

end
