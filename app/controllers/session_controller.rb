class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :username => params[:username]
    if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to(root_path)
    else
        flash[:error] = "Invalid login or password"
        redirect_to(login_path)
    end
    # user fills in username and password, do we havea user with this name?
    # if we have a user, if the user has something in it, 
    # and the authenticate method returns true
    # then we can log them in
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
