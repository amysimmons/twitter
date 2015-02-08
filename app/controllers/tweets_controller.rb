class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create

    @user = User.find_by username: params[:username]
    session[:username] = @user.username
    tweet = Tweet.create tweet_params
    redirect_to :controller => 'users', :action => 'show_user', :username => @current_user.username

    tweet.update(:user_id => @current_user.id)

  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def show
    @tweet = Tweet.find params[:id]
  end

  def update
  end

  def destroy
    tweet = Tweet.find params[:id]
    tweet.delete
    # redirect_to works_path
  end

  def tweet_params
    params.require(:tweet).permit(:content, :tweet_location, :in_reply_to)
  end

end
