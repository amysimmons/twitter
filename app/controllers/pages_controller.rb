class PagesController < ApplicationController
     def home
        # @user = User.find session[:user_id] if session[:user_id].present?
        @user = User.new
        @username = User.find_by username: params[:username]
        

        @tweets = Tweet.news

        @tweets.each do |tweet|

          if @curent_user.present? && @current_user.following.include?(tweet.user)
            @tweets = []
            @tweets << tweet
          end
        end
    end

end


