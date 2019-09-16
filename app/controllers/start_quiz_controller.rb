class StartQuizController < ApplicationController
  def welcome
  end

  def start
    render "start_quiz/start"
  end
end
