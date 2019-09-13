class QuizController < ApplicationController
  def quizzes
    @collections = Collection.all 
  end

  def show_quiz 
    quizId = params[:id]
    @quiz = Quiz.find(quizId)
    render "quiz/show_quiz"
  end 
  def new_quiz
    collectionId = params[:collection_id]
    @collection = Collection.find(collectionId)
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

  def update_quiz_by_id
    quizId = params[:id]
    updateField = params[:update]
    updateValue = params[:newField]
    puts updateField 
    puts updateValue 
    @quiz = Quiz.find(quizId)
    if @quiz[updateField] = updateValue
      puts "The quiz was updated"
    else 
      puts "The quiz was not updated"
    end 
    render "quiz/show_quiz"
  end 

  def error 
    render "quiz/error_quiz"
  end 
end
