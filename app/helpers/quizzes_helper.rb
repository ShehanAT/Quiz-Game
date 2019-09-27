module QuizzesHelper

    def render_welcome_message 
        if !session[:user_id]
            content_tag(:h1, "Please Login Or Register") +
            content_tag(:h3, "Choose An Action:")
        else 
            content_tag(:h1, "Welcome " << session[:username]) +
            content_tag(:h3, "Choose An Action:")
        end 
    end 

    def render_register_link
        if !session[:user_id]
            content_tag :li do 
              link_to "Register", new_users_path, id: "register_link"
            end
        end 

        
    end

    def render_login_link 
        if !session[:user_id]
            content_tag :li do 
                link_to "Login", new_sessions_path, id: "login_link"
            end 
        end 
    end 

    def render_logout_link 
        if session[:user_id]
            content_tag :li do
              link_to "Log Out", sessions_path, method: "delete", id: "logout_link"
            end 
        end 
    end 
    
end
