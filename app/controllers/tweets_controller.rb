class TweetsController < ApplicationController
  def index
  end

  def create
      tweet = Tweet.new tweet_params
      redirect_to username_path
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
