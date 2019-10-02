class QuestionsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def new 
    @question = Question.new
    @quiz = Quiz.find(session[:quiz_id])  
    respond_to do |format|
      format.html { render "new" }
      format.js { render "new" }
      format.json { render json: {path: "#{new_questions_path}", quiz_name: params[:name] } }
    end 
  end 

  def create 
    Content.addQuizContent(params[:questionArr])
    # if @question.save!
    #   redirect_to quiz_path()
    # else 
    #   respond_to do |format|
    #     format.html { render "new" }
    #     format.js { render "new" }
    #   end 
    # end 
  end 
end
