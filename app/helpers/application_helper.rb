module ApplicationHelper
    def nav_menu
        logo = "<a href='#{root_path}'><i class='fa fa-twitter'></i></a>"
        # if @current_user.present?

        #     links = "<a href='#{root_path}' class='nav-link'><i class='fa fa-home'></i>Home</a>"
        #     # links = "<li>#{link_to('Home', root_path)}</li>"

        #     links += "<a href='#{username_path(@current_user.username)}' class='nav-link'>#{'@' + @current_user.username}</a>"
        #     # links += "<li>#{link_to('@' + @current_user.username, username_path(@current_user.username))}</li>"
            
        #     links += "<a href='#{new_tweet_path}' class='nav-link'><i class='fa fa-pencil-square-o'></i>New Tweet</a>"
        #     # links += "<li>#{ link_to('New tweet ', new_tweet_path)}</li>"
            
        #     links += "<a href='#{login_path}' data-method='delete' class='nav-link'><i class='fa fa-sign-out'></i>Sign out</a>"
        #     # links += "<li>#{ link_to('Sign out ', login_path, :method => :delete )}</li>"
            
        #     logo + links
        # else
        #     logo
        # end
    end
end
