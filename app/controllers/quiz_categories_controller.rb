class QuizCategoriesController < ApplicationController

    def show
        Rails.logger.info params 
        get_all_quizzes = "SELECT * FROM quizzes WHERE category='#{params[:category]}'"
        results = ActiveRecord::Base.connection.execute(get_all_quizzes)
        Rails.logger.info results
    end 
end
