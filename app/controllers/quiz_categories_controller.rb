class QuizCategoriesController < ApplicationController

    def show
        @category = QuizCategory.find(params[:id])
        get_all_quizzes = "SELECT * FROM quizzes WHERE category='#{@category.category}'"
        @quizzes = ActiveRecord::Base.connection.execute(get_all_quizzes)
    end 
end
