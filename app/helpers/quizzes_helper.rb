module QuizzesHelper

    def render_welcome_message 
        if !session[:user_id]
            content_tag(:h1, "Quiz Game") 
        else 
            content_tag(:h1, "Welcome " << session[:username])
        end 
    end 

    def render_register_link
        if !session[:user_id]
            content_tag :li do 
              link_to "Register", new_user_path, id: "register_link"
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

  

    def render_answer_links
            @content = "<div id='quiz_gameplay_section'>"
            @content << "<h3 class='save_score_message' style='display:none;'>Your score: </h3>"
            @content << "<h3 id='current_question' style='display:none;'>current_question</h3>"
            @content << "<img id='current_question_img' alt='question image' style='display: none;'/>"
            @content << "<div class='choice_btn_section'>"
            @content << "<button id='answer1' style='display:none' class='answer_link btn'>answer1</button>"
            @content << "<button id='answer2' style='display:none' class='answer_link btn'>answer2</button>"
            @content << "<button id='answer3' style='display:none' class='answer_link btn'>answer3</button>"
            @content << "<button id='answer4' style='display:none' class='answer_link btn'>answer4</button>"
            @content << "</div></div>"
            return @content.html_safe
    end 

    def render_end_game_message
        content_tag(:div, :id => "quiz_end_game_section") do 
            @content = content_tag(:h3, "Quiz Finished!", :id => "end_quiz_message", :style => "display:none")
            @content << content_tag(:h4, "Your score: ", :id => "end_score_message", :style => "display:none" )
            @content << content_tag(:h4, " ", :id => "save_score_status", :style => "display:none" )
            @content << content_tag(:button, "Replay Quiz<i class='material-icons left'>replay</i>".html_safe, :onclick => "replayQuiz()", :id => "replay_quiz_button", :style => "display:none", :class => "btn waves-effect waves-light" )
            @content << content_tag(:button, "Back To Homepage<i class='material-icons left'>home</i>".html_safe, :onclick => "goToHomePage()", :id => "home_page_button", :style => "display:none", :class => "btn waves-effect waves-light" )
        end 
    end 

    def render_quizzes_link 
        content_tag(:div, :class => 'questions_section') do 
            content_tag(:a, "Quizzes", :id => 'questions_link', :href => '/questions')
        end 
    end 
    
end
