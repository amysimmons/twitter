class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create

    #@user = User.find_by username: params[:username]
    #session[:username] = @user.username
    tweet = Tweet.create tweet_params

    tweet.update(:user_id => @current_user.id)
    redirect_to "/#{@current_user.username}" #:controller => 'users', :action => 'show_user', :username => @current_user.username
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweets = [@tweet]
  end

  def update
  end

  def destroy
    tweet = Tweet.find params[:id]
    tweet.delete
    redirect_to root_path
  end

  # def newsfeed
  #   @tweets = Tweet.all
  # end


  def news

    # redirect_to root_path
    # @tweets = Tweet.all
    # @tweet = Tweet.find params[:user_id]
    
        @newstweets = Tweet.news
        @tweets = []
        @newstweets.each do |tweet|
            if @current_user.following.include?(tweet.user)
                @tweets << tweet
            end
        end

    render 'newsfeed'

  end

  def all
    # redirect_to root_path
      @alltweets = Tweet.all
      @tweets = []
      @alltweets.each do |tweet|
          if @current_user.following.include?(tweet.user)
              @tweets << tweet
          end
      end
    # binding.pry
    render 'newsfeed'
  end

  def mentions
    # redirect_to root_path

    @tweets = Tweet.mentions(@current_user)
    render 'newsfeed'

  end

  def reply
    @tweet = "RT: " + tweet.content
    redirect_to username_tweets_path
  end

  def retweet

    # pass the id 
    # get the tweet , get the contents , get the user, create a new tweet
    # rt + 
    # pass the id of the original tweet

    # redirect_to username_tweets_path
  end

  def favourite

  end

  def tweet_params
    params.require(:tweet).permit(:content, :tweet_location, :in_reply_to)
  end

end
