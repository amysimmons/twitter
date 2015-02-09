class RelationshipsController < ApplicationController
    
    before_action :logged_in_user

    def create
        user = User.find_by username: params[:username]
        current_user.follow(user)
        redirect_to username_following_path
    end

    def destroy
        user = Relationship.find_by username: params[:username].followed
        current_user.unfollow(user)
        redirect_to username_following_path
    end
    
end

