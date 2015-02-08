class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create
      
      # raise params.inspect
      @user = User.find_by username: params[:username]
      # redirect_to username_path
      session[:username] = @user.username
      
    tweet = Tweet.create tweet_params
    redirect_to :controller => 'users', :action => 'show_user', :username => @current_user.username
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
  end

  def tweet_params
    params.require(:tweet).permit(:content, :tweet_location, :in_reply_to)
  end

end
