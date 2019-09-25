class StartQuizController < ApplicationController
  def welcome
    @quizzes = Quiz.all
  end

  def start
  end

  def quiz_list
    @quizzes = Quiz.all 
  end 

  def setup_quiz
    session[:quiz_select] = params[:quiz_select]
    redirect_to "/quiz"
  end
end
