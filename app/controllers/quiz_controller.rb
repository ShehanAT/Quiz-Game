class QuizController < ApplicationController
  def quizzes
    render "quizzes"
  end

  def create_quizzes 
    @quiz = Quiz.new({
        question: "Question for quizzes_controller_test:18 ?",
        answer: "Answer for quizzes_controller_test:18 ?"
      })
    puts @quiz.question 
    if @quiz.save 
      puts "Quiz was saved"
    else 
      puts "Quiz was not saved"
    end 
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
      "this is a sample url"
  end  

  def new_quiz_url
      render "new_quiz_url"
  end

  def error 
    render "error_quiz"
  end 
end
