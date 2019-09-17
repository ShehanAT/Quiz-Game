class QuizController < ApplicationController
  def quizzes
    @collections = Collection.all 
  end

  def show_quiz 
    @quiz = Quiz.find(params[:id])
    render "quiz/show_quiz"
  end 
  def new_quiz
    @collection = Collection.find(params[:collection_id])
    @collection.quiz.create(:question => "This quiz is a new question?", :answer => "This is a new answer?")
    if @collection.save!
      Rails.logger.info "The new quiz was saved"
    else 
      Rails.logger.info "The new quiz was not saved"
    end 
    render "quiz/new_quiz"
  end

  def new_quiz_to_collection 
    question = params[:question]
    answer = params[:answer]
    @collection = Collection.find(params[:collection_id])
    @collection.quiz.create(:question => question, :answer => answer)
    if @collection.save!
      Rails.logger.info "The new quiz was saved"
    else 
      Rails.logger.info "The new quiz was not saved"
    end 
    render "quiz/new_quiz"
  end 

  def delete_quiz_by_id
    quiz = Quiz.find(params[:id])
    if quiz.delete
      Rails.logger.info "The quiz was deleted"
    else 
      Rails.logger.info "The quiz was not deleted"
    end 
  end 

  def update_quiz_by_id
    updateField = params[:update]
    updateValue = params[:newField]
    @quiz = Quiz.find(params[:id])
    if @quiz[updateField] = updateValue
      Rails.logger.info "The quiz was updated"
    else 
      Rails.logger.info "The quiz was not updated"
    end 
    render "quiz/show_quiz"
  end 

  def error 
    render "quiz/error_quiz"
  end 
end
