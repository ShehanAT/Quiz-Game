class StartQuizController < ApplicationController
  def welcome
    @quizzes = Quiz.all
  end

  def start
  end

  def quiz_list
    @quizzes = Quiz.all 
  end 
end
