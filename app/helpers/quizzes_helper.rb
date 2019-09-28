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

    def render_answer_links
        content_tag(:div, :id => "quiz_gameplay_section") do 
            @content = content_tag(:h3, "Your score: ", :class => "save_score_message", :style => "display:none" )
            @content << content_tag(:h3, "current_question", :id => "current_question", :style => "display:none")
            @content << content_tag(:button, "answer1", :id => "answer1", :href => "", :style => "display:none", :class => "answer_link" )
            @content << content_tag(:br)
            @content << content_tag(:button, "answer2", :id => "answer2", :href => "", :style => "display:none", :class => "answer_link" )
            @content << content_tag(:br)
            @content << content_tag(:button, "answer3", :id => "answer3", :href => "", :style => "display:none", :class => "answer_link" )
            @content << content_tag(:br)
            @content << content_tag(:button, "answer4", :id => "answer4", :href => "", :style => "display:none", :class => "answer_link" )
        end 
    end 

    def render_end_game_message
        content_tag(:div, :id => "quiz_end_game_section") do 
            @content = content_tag(:h3, "Quiz Finished!", :id => "end_quiz_message", :style => "display:none")
            @content << content_tag(:h4, "Your score: ", :id => "end_score_message", :style => "display:none" )
            @content << content_tag(:h4, " ", :id => "save_score_status", :style => "display:none" )
            @content << content_tag(:button, "Replay Quiz", :onclick => "replayQuiz()", :id => "replay_quiz_button", :style => "display:none" )
            @content << content_tag(:button, "Take Another Quiz", :onclick => "goToQuizzes()", :id => "another_quiz_button", :style => "display:none" )
            @content << content_tag(:button, "Back To Homepage", :onclick => "goToHomePage()", :id => "home_page_button", :style => "display:none" )
        end 
    end 

    def render_quizzes_restfull_routes
        content_tag(:div, :id => "quizzes_restfull_section") do 
            button_to("Add New Quiz", new_quiz_url, :id => "new_quiz_link", method: :get )
        end 
    end 
    
end
