class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id] #if not assigned already, assign it. This line returns nil if session :user_id evaluates to false. The method would return nothing (nil)
    #when true, we'll have access to user model object
  end

  def require_login #tact it to any controller actions that require login
    if current_user.nil?
      flash[:error] = "You must be logged in to view this section"
      # redirect_to root_path
    end
  end
end
