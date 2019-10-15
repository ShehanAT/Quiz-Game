module ApplicationHelper 

    def navbar_quiz_links 
        quiz_category_id_sql = "SELECT quiz_categories.id, quiz_categories.category FROM quiz_categories;"
        quiz_category_ids = ActiveRecord::Base.connection.execute(quiz_category_id_sql)
        @content = ""
        quiz_category_ids.each do |quiz_category|
            quizzes = Quiz.where(category: quiz_category["category"]) 
            @content << "<li class='nav-item dropdown' ><a class='nav-link dropdown-toggle' href='' id='drop' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>#{quiz_category["category"]}</a>
            <div class='dropdown-menu' aria-labelledby='navbarDropdown'>"
            quizzes.each do |quiz|
                @content << link_to("#{quiz.name}", quiz_path(quiz.id), :class => "dropdown-item", :id => "#{quiz.name}")
            end 
            @content << "</div>"
            @content << "</li>"
        end 
        return @content.html_safe
    end 
    

end 