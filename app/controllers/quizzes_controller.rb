class QuizzesController < ApplicationController

    def index 
        @quizzes = Quiz.all   
    end 

    def new 
        @new_quiz = Quiz.new
        respond_to do |format|
            format.html { render "new" }
            format.js { render "new" }
            format.json { render :json =>  @new_quiz }
        end 
    end 

    def create
        @new_quiz = Quiz.new(quiz_params)
        if @new_quiz.save
            redirect_to quiz_path(@new_quiz.id) 
        else 
            respond_to do |format|
                format.html { render "new" }
                format.js { render "new" }
            end
        end 
    end

    def show
        @quiz = Quiz.find(params[:id])
        @questions = Question.where(quiz_id: params[:id])
        @answers = Answer.where(quiz_id: params[:id])
        respond_to do |format|
            format.html { render "show" }
            format.js { render "show" }
            format.json { render json: {questions: @questions, quiz: @quiz, answers: @answers} }
        end 
    end 

    def save_score 
        old_session = Session.where(user_id: session[:user_id]).take
        if old_session
            update_status = old_session.eval_highest_score(params[:score])
            respond_to do |format|
                format.json { render json: { status: update_status}}
            end 
        else 
            new_session = Session.create(:user_id => session[:user_id], :quiz_id => params[:quiz_id], :highScore => params[:score])
            respond_to do |format|
                format.json { render json: { status: "High Score Saved" } }
            end
        end
    end 

    private 
    def quiz_params
        params.require(:quiz).permit(:name, :category, :total_questions, :description)
    end
end
