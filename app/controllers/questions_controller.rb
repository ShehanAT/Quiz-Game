class QuestionsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def new 
    @question = Question.new
    @quiz = Quiz.find(session[:quiz_id])  
    respond_to do |format|
      format.html { render "new" }
      format.json { render json: {path: "#{new_questions_path}", quiz_name: params[:name] } }
    end 
  end 

  def create 
    Content.addQuizContent(params[:questionArr].to_json, session[:quiz_id])
    respond_to do |format|
      format.json { render json: { redirect: "/questions" } }
    end 
  end 

  def show 
    @questions = Question.all
  end 
end
