class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate 


  private 
  def authenticate 
    if session[:username].present?
        @current_user = User.find_by :username => session[:username]

        # @current_user = User.find_by :username => session[:username]
        # @user = User.new
        # @username = User.find_by :username => session[:username]

    end
    session[:username] = nil unless @current_user.present?
  end
  #set up a variable with user in it if we can find the user in the database
end
