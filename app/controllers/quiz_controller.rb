class QuizController < ApplicationController
  def quizzes
    render "quizzes"
  end

  def create_quizzes
    @sample = Sample.new()
    # puts @sample.question
    if @sample.save 
      puts "Quiz was saved"
    else 
      puts "Quiz was not saved"
    end
    redirect_to "quiz/quizzes" 
  end 

  def quiz_quiz_url(quiz_url)
    redirect_to "#{quiz_url}"
  end

  def show_quiz(quiz_url)
    render "#{quiz_url}"
  end

  def random_redirect 
    redirect_to "quiz/quizzes"
  end 

 
  def new_quiz
    render "new_quiz"
  end

  def quiz
    @quiz = Quiz.new 
    @quiz.question = "Sample Question?"
    @quiz.answer = "Sammple Answer"
    if @quiz.save 
      redirect_to @quiz
    else 
      render "error_quiz" 
    end 
  end

  def quiz_url
      render "quiz/quiz"
  end  

  def new_quiz_url
      render "new_quiz_url"
  end

  def error 
    render "error_quiz"
  end 
end
