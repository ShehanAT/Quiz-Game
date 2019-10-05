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
  def index 
    @questions = Question.all
    get_questions_quizzes = "SELECT * FROM questions INNER JOIN quizzes ON questions.quiz_id=quizzes.id;"
    @results = ActiveRecord::Base.connection.execute(get_questions_quizzes)
  end 

  def show 
    get_question_quiz = "SELECT * FROM questions INNER JOIN quizzes ON questions.quiz_id=quizzes.id WHERE questions.id='#{params[:id]}'"
    @question = ActiveRecord::Base.connection.execute(get_question_quiz)
  end 
end
