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
    get_question_quiz = "SELECT questions.id, questions.quiz_id, questions.question, quizzes.name, quizzes.category, quizzes.description FROM questions INNER JOIN quizzes ON questions.quiz_id=quizzes.id WHERE questions.id='#{params[:id]}';"
    @question = ActiveRecord::Base.connection.execute(get_question_quiz)
    quiz_id = @question[0]["quiz_id"]
    get_answers = "SELECT * FROM answers WHERE quiz_id='#{quiz_id}' AND question_id='#{params[:id]}'"
    @answers = ActiveRecord::Base.connection.execute(get_answers)
  end 

  def edit 
    @question = Question.find(params[:id])
    quiz_id = @question["quiz_id"]
    get_answers = "SELECT * FROM answers WHERE quiz_id='#{quiz_id}' AND question_id='#{params[:id]}'"
    @answers = ActiveRecord::Base.connection.execute(get_answers)
  end
  
  def update 
    if(params[:commit] === "Update Question")
      Content.updateQuestion(params)
    elsif(params[:commit] === "Delete This Question")
      Content.deleteQuestion(params[:question_id])
    end 
    redirect_to questions_path
  end 
end
