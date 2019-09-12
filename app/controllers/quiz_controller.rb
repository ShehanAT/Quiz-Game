class QuizController < ApplicationController
  def quizzes
    @collection = Collection.all 
  end

  def sample_populate  
    @collection = Collection.create(:collection_id => 1, :name => "Sample Collection")
    for a in 1..5 do
      @collection.quiz.create(:question => "This is sample question ##{a}?", :answer => "This is sample answer ##{a}")
      if @collection.save!
        puts "Sample quiz ##{a} saved"
      else 
        puts "Sample quiz ##{a} not saved"
      end 
    end 
    redirect_to action: "quizzes"
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
    @collection = Collection.create
    @collection.quiz.create(:question => "This quiz is a new question?", :answer => "This is a new answer?")
    if @collection.save!
      puts "The new quiz was saved"
    else 
      puts "The new quiz was not saved"
    end 
    render "quiz/new_quiz"
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
