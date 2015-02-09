class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new user_params
    # this will create a new user with this parameters but it won't save them in the database
    # first i want to see if their passwords match
    if @user.save  
        session[:username] = @user.username
        # redirect_to :controller => 'users', :action => 'show_user', :username => @user.username
        redirect_to root_path
    else
        render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by username: params[:username]
  end

  def edit_user
    @user = User.find_by username: params[:username]
  end

  def show
    @user = User.find params[:id]
  end

  def show_user
    @user = User.find_by username: params[:username]
    @tweets = @user.tweets
  end

  def update
  end

  def update_user
    user = User.find_by username: params[:username]
    # user = User.find params[:username]
    user.update user_params
    redirect_to username_path
  end

  def destroy
    user = User.find params[:id]
    user.delete
    redirect_to root_path
  end

  def tweets

    @tweets = @current_user.tweets
    render 'userfeed'

  end

  def following 
    render 'userfeed'
  end

  def followers 
    render 'userfeed'
  end

  private
    def user_params
        params.require(:user).permit(:name, :email, :username, :bio, :organisation, :user_location, :profile_pic, :is_news, :is_admin, :password, :password_confirmation)
    end

    def check_if_admin
        redirect_to(root_path) unless @current_user.present? && @current_user.is_admin?
    end
end
