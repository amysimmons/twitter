module ApplicationHelper
    def nav_menu
        # links = "<li>#{link_to('Home', root_path)}</li>"

        logo = "<i class='fa fa-twitter'></i>"

  

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
            # links += "<li>#{link_to('Sign up', new_user_path)}</li><li>#{link_to('Log in', login_path)}</li>"
        end

    end
end
