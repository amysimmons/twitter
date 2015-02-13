class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end

  def create
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

  def news
    @newstweets = Tweet.news
    @tweets = []
    @newstweets.each do |tweet|
        if @current_user.following.include?(tweet.user)
            @tweets << tweet
        end
    end
    @tweets = @tweets
    render 'newsfeed'
  end

  def all
    @alltweets = Tweet.all
    @tweets = []
    @alltweets.each do |tweet|
        if @current_user.following.include?(tweet.user)
            @tweets << tweet
        end
    end
    @tweets = @tweets
    render 'newsfeed'
  end

  def mentions
    @tweets = Tweet.mentions(@current_user)
    render 'newsfeed'
  end

  def reply
    redirect_to new_tweet_path
  end

  def retweet
    @original_tweet = Tweet.find params[:id]

    @retweet = Tweet.new

    @retweet.user_id = @current_user.id
    @retweet.content = @original_tweet.content

    @retweet.original_tweet_id = @original_tweet.id

    @retweet.save

    redirect_to username_path
  end

  # Add and remove favourite tweets
  # for current_user
  def favourite
    @tweet = Tweet.find params[:id]

    type = params[:type]
    if type == "favourite"
      @current_user.favourites << @tweet
      # redirect_to :back, notice: 'You favourited #{@tweet.username}'
      redirect_to root_path

    elsif type == "unfavourite"
      @current_user.favourites.delete(@tweet)
      # redirect_to :back, notice: 'Unfavourited #{@tweet.username}'
      redirect_to root_path

    else
      # Type missing, nothing happens
      # redirect_to :back, notice: 'Nothing happened.'
      redirect_to root_path
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :tweet_location, :in_reply_to)
  end
end
