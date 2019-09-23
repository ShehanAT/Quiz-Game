class QuestionController < ApplicationController
  def questions
    @questions = Question.all 
  end

  def show_question
    @question = Question.find(params[:id])
    render "question/show_question"
  end 
  def new_question
    @quiz = Quiz.find(params[:quiz_id])
    @quiz.question.create(:quiz_id => params[:quiz_id], :answerId => params[:answerId])
    if @quiz.save!
      Rails.logger.info "The new quiz was saved"
    else 
      Rails.logger.info "The new quiz was not saved"
    end 
    render "question/new_question"
  end

  def new_question_to_quiz
    quiz_id = params[:quiz_id]
    answerId = params[:answerId]
    @quiz = Quiz.find(params[:quiz_id])
    @quiz.question.create(:quiz_id => quiz_id, :answerId => answerId)
    if @quiz.save!
      Rails.logger.info "The new quiz was saved"
    else 
      Rails.logger.info "The new quiz was not saved"
    end 
    render "quiz/new_quiz"
  end 

  def delete_question_by_id
    question = Question.find(params[:id])
    if question.delete
      Rails.logger.info "The question was deleted"
    else 
      Rails.logger.info "The question was not deleted"
    end 
  end 

  def update_question_by_id
    updateField = params[:update]
    updateValue = params[:newField]
    @question = Question.find(params[:id])
    if @question[updateField] = updateValue
      Rails.logger.info "The question was updated"
    else 
      Rails.logger.info "The question was not updated"
    end 
    render "question/show_question"
  end 

  def error 
    render "question/error_question"
  end 
end
