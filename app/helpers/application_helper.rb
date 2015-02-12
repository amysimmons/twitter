module ApplicationHelper
    def nav_menu
        logo = "<a href='#{root_path}'><i class='fa fa-twitter'></i></a>"
        if @current_user.present?
            # if@current_user.is_admin?
            #     links += "<li>#{link_to('All users', users_path)}</li>"
            # end
            links = "<li>#{link_to('Home', root_path)}</li>"
            links += "<li>#{link_to('@' + @current_user.username, username_path(@current_user.username))}</li>"
            links += "<li>#{ link_to('New tweet ', new_tweet_path)}</li>"
            links += "<li>#{ link_to('Sign out ', login_path, :method => :delete )}</li>"
            logo + links
        else
            logo
        end
    end
end
