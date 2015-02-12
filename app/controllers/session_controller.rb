class SessionController < ApplicationController
  def new
  end
  def create
    user = User.find_by :username => params[:username]
    if user.present? && user.authenticate(params[:password])
        session[:username] = user.username
        # redirect_to :controller => 'users', :action => 'show_user', :username => user.username
        redirect_to root_path
    else
        flash[:error] = "Invalid login or password"
        redirect_to(root_path)
    end
  end
  def destroy
    session[:username] = nil
    redirect_to(root_path)
  end
end