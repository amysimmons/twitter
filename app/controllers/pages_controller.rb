class PagesController < ApplicationController
     def home
        # @user = User.find session[:user_id] if session[:user_id].present?
        @user = User.new
        @username = User.find_by username: params[:username]
     end
end