module ApplicationHelper

    def navbar_quiz_links 
        quiz_categories_sql = "SELECT DISTINCT quizzes.category FROM quizzes;"
        @quiz_categories = ActiveRecord::Base.connection.execute(quiz_categories_sql)
        @content = content_tag(:div, "",:class => 'dropdown-menu')
        @quiz_categories.each do |quiz_category|
            @content << link_to("#{quiz_category["category"]}", quiz_category_path(1), :class => "dropdown-item")
        end 
        return @content 
    end 
end
