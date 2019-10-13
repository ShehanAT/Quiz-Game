class QuizzesController < ApplicationController

    def home 
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end 

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
        Score.set_quiz_id(session, params[:id])
        @quizContent = Quiz.getQuizContent(params[:id])  
        @quiz = Quiz.find(params[:id])      
        respond_to do |format|
            format.html { render "show" }
            format.js { render "show" }
            format.json { render json: {quizContent: @quizContent, quiz: @quiz } }
        end 
    end 

    def edit  
        @quiz = Quiz.find(params[:id])
    end 
    
    def update 
        if(params[:commit] === "Update Quiz")
            Quiz.updateQuiz(params)
        elsif(params[:commit] === "Delete This Quiz")
            Quiz.deleteQuiz(params[:quiz_id])
        end 
        redirect_to quizzes_path
    end     

    def save_score 
        old_score = Score.where(user_id: session[:user_id]).take
        if old_score
            update_status = old_score.eval_highest_score(params[:score])
            respond_to do |format|
                format.json { render json: { status: update_status}}
            end 
        else 
            new_score= Score.create(:user_id => session[:user_id], :quiz_id => params[:quiz_id], :highScore => params[:score])
            respond_to do |format|
                format.json { render json: { status: "High Score Saved" } }
            end
        end
    end 
    
    def destroy 
        Quiz.destroy(params[:id])
        delete_all_questions_sql = "DELETE FROM questions WHERE quiz_id='#{params[:id]}'"
        ActiveRecord::Base.connection.execute(delete_all_questions_sql)
        delete_all_answers_sql = "DELETE FROM answers WHERE quiz_id='#{params[:id]}'"
        ActiveRecord::Base.connection.execute(delete_all_answers_sql)
        respond_to do |format|
            format.js { render "quizzes/js/delete_quiz"}
            format.json { render json: { status: true, message: "Quiz And All Associated Questions Deleted Successfully!" } }
        end     
    end 

    private 
    def quiz_params
        params.require(:quiz).permit(:name, :category, :description)
    end
end
