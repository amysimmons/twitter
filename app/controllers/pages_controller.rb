class PagesController < ApplicationController
     def home
        # @user = User.find session[:user_id] if session[:user_id].present?
        @user = User.new
        @username = User.find_by username: params[:username]
        
        @newstweets = Tweet.news
        @tweets = []
        @newstweets.each do |tweet|
            if @current_user.present? && @current_user.following.include?(tweet.user)
                @tweets << tweet
            end
        end
    end

end


