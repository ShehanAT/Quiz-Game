class QuizzesController < ApplicationController

    def index 
        @quizzes = Quiz.all   
    end 

    def new 
        @quiz = Quiz.new
        respond_to do |format|
            format.html { render "new" }
            format.js { render "new" }
            format.json { render :json =>  @quiz }
        end 
    end 

    def create
        @quiz = Quiz.new(quiz_params)
        if @quiz.save
            redirect_to quiz_path(@quiz.id) 
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
        @answers_arr = []
        sql = "SELECT * FROM answers INNER JOIN questions ON answers.question_id = questions.id;"
        array = ActiveRecord::Base.connection.execute(sql)
  
        array.each do |answer|
            Rails.logger.info "#{answer["quiz_id"]}"
        end
        session[:quiz_id] = @quiz.id 
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
        params.require(:quiz).permit(:name, :category, :description)
    end
end
