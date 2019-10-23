module ApplicationHelper

    def navbar_quiz_links 
        quiz_category_id_sql = "SELECT quiz_categories.id, quiz_categories.category FROM quiz_categories;"
        quiz_category_ids = ActiveRecord::Base.connection.execute(quiz_category_id_sql)
        @content = ""
        quiz_category_ids.each do |quiz_category|
            quizzes_sql = "SELECT * FROM quizzes WHERE category=LTRIM(RTRIM('#{quiz_category["category"]}')) OR category='#{quiz_category["category"] << " "}'"
            quizzes = ActiveRecord::Base.connection.execute(quizzes_sql)
            @content << "<li><label for='drop-1' class='toggle'></label><a href='/quiz_categories/#{quiz_category["id"]}' class='quiz_category_link' >#{quiz_category["category"]}</a>
            <input type='checkbox' id='drop-1'/>
            <ul>"
            quizzes.each do |quiz|
                @content << "<li>"
                @content << link_to("#{quiz["name"]}", quiz_path(quiz["id"]), :class => "dropdown-item", :id => "#{quiz["name"]}")
                @content << "</li>"
            end 
            @content << "</ul>"
            @content << "</li>"
        end 
        return @content.html_safe
    end 
end
