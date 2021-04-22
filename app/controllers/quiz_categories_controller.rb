class QuizCategoriesController < ApplicationController

    def show
        @category = QuizCategory.find(params[:id])
        quizzes_sql = "SELECT * FROM quizzes WHERE category=LTRIM(RTRIM('#{@category.category}')) OR category='#{@category.category << " "}'"
        @quizzes = ActiveRecord::Base.connection.execute(quizzes_sql)
    end 
end
