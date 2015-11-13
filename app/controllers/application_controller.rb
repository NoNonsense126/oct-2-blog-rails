class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private
    def authenticate_user!
      unless user_logged_in?
        flash[:warning] = "Please login!"
        redirect_to login_path 
      end
    end
end
