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
      flash[:success] = "Question Added Successfully!"
      redirect_to quiz_path(session[:quiz_id])
    elsif params[:commit] === "Submit And Add Another Question"
      flash[:success] = "Question Added. Keep Adding Questions!" 
      redirect_to new_question_path
    end 
  end 

  def index 
    get_questions_quizzes = "SELECT questions.id AS question_id, * FROM questions INNER JOIN quizzes ON questions.quiz_id=quizzes.id;"
    @results = ActiveRecord::Base.connection.execute(get_questions_quizzes)
    @questions_per_page = Kaminari.paginate_array(@results, total_count: @results.count).page(params[:page])
  end

  def show 
    get_question_quiz = "SELECT questions.id, questions.quiz_id, questions.question, quizzes.name, quizzes.category, quizzes.description, quizzes.contains_images FROM questions INNER JOIN quizzes ON questions.quiz_id=quizzes.id WHERE questions.id='#{params[:id]}';"
    @question = ActiveRecord::Base.connection.execute(get_question_quiz)
    @quiz_id = @question[0]["quiz_id"]
    if @question[0]["contains_images"] === 1
      @question_image = QuestionImage.find_by(quiz_id: @question[0]["quiz_id"], question_id: @question[0]["id"])
    end 
    get_answers = "SELECT * FROM answers WHERE quiz_id='#{@quiz_id}' AND question_id='#{params[:id]}'"
    @answers = ActiveRecord::Base.connection.execute(get_answers)
  end 

  def edit 
    @question = Question.find(params[:id])
    quiz_id = @question["quiz_id"]
    @quiz = Quiz.find(quiz_id)
    if @quiz.contains_images === 1
        @image = QuestionImage.find_by(question_id: @question.id, quiz_id: @quiz.id)
    end 
    get_answers = "SELECT * FROM answers WHERE quiz_id='#{quiz_id}' AND question_id='#{params[:id]}'"
    @answers = ActiveRecord::Base.connection.execute(get_answers)  
    respond_to do |format|
      format.html { render "edit" }
      format.js { render "questions/js/edit.js.erb" }
    end  
  end
  
  def update 
    Question.updateQuestion(params)
    respond_to do |format|
      format.html { redirect_to question_path(params[:id]) }
      format.json { render json: { status: true, message: "Question Updated Successfully!", redirect: "/questions/#{params[:question][:id]}"} }
    end 
  end 

  def destroy 
    Question.deleteQuestion(params[:question_id], params[:quiz_id])
    respond_to do |format|
      format.html { render "edit" }
      format.json { render json: { status: true, redirect: "/questions" } }
    end 
  end 
end
