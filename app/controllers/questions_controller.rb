class QuestionsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  
  def new 
    @question = Question.new
    @quiz = Quiz.find(session[:quiz_id]) 
    if @quiz.contains_images === 1
      flash[:notice] = "images"
    end 
    render "new"
  end 

  def create 
    if params[:question_image]
      Quiz.addImageQuizContent(params, session[:quiz_id])
    else 
      Quiz.addTextQuizContent(params, session[:quiz_id])
    end 
    if params[:commit] === "Submit And Exit"
      flash[:notice] = "Question Added Created Successfully!"
      redirect_to quiz_path(session[:quiz_id])
    elsif params[:commit] === "Submit And Add Another Question"
      flash[:success] = "Question Added. Keep Adding Questions!" 
      redirect_to new_question_path
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
    respond_to do |format|
      format.html { render "edit" }
    end  
  end
  
  def update 
    Question.updateQuestion(params)
    respond_to do |format|
      format.html { render "edit" }
      format.json { render json: { status: true, message: "Question Updated Successfully!", redirect: "/questions"} }
    end 
  end 

  def destroy 
    Question.deleteQuestion(params[:question_id])
    respond_to do |format|
      format.html { render "edit" }
      format.json { render json: { status: true, redirect: "/questions" } }
    end 
  end 
end
