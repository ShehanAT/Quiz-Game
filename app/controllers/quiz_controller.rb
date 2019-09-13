class QuizController < ApplicationController
  def quizzes
    @collections = Collection.all 
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

  def new_quiz_to_collection 
    collection_id = params[:collection_id]
    question = params[:question]
    answer = params[:answer]
    @collection = Collection.find(collection_id)
    @collection.quiz.create(:question => question, :answer => answer)
    if @collection.save!
      puts "The new quiz was saved"
    else 
      puts "The new quiz was not saved"
    end 
    render "quiz/new_quiz"
  end 

  def delete_quiz_by_id
    quizId = params[:id]
    quiz = Quiz.find(quizId)
    if quiz.delete
      puts "The quiz was deleted"
    else 
      puts "The quiz was not deleted"
    end 
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
