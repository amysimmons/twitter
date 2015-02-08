class PagesController < ApplicationController
     def home
        # @user = User.find session[:user_id] if session[:user_id].present?
        @user = User.new
        @username = User.find_by username: params[:username]
     end
end

    def show_news_tweets
        puts "hello world"
    end

    def show_all_tweets
        puts "hello world"
    end

    def show_mentions
        puts "hello world"
    end
