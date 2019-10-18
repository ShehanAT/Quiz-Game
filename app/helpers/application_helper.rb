module ApplicationHelper

    def navbar_quiz_links 
        quiz_category_id_sql = "SELECT quiz_categories.id, quiz_categories.category FROM quiz_categories;"
        quiz_category_ids = ActiveRecord::Base.connection.execute(quiz_category_id_sql)
        @content = ""
        quiz_category_ids.each do |quiz_category|
            quizzes = Quiz.where(category: quiz_category["category"]) 
            @content << "<li class='nav_item'><a href='/quiz_categories/#{quiz_category["id"]}'>#{quiz_category["category"]}</a>
            <ul class='hidden'>"
            quizzes.each do |quiz|
                @content << "<li>"
                @content << link_to("#{quiz.name}", quiz_path(quiz.id), :class => "dropdown-item", :id => "#{quiz.name}")
                @content << "</li>"
            end 
            @content << "</ul>"
            @content << "</li>"
        end 
        return @content.html_safe
    end 
end
