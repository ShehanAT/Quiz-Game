class QuizzesController < ApplicationController

    def index 
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
        @quizzes = Quiz.all   
        # sqlite3 version
        # quiz_categories_sql = "SELECT DISTINCT LTRIM(RTRIM(quizzes.category)) FROM quizzes;"
        # postgresql version
        quiz_categories_sql = "SELECT DISTINCT TRIM(BOTH FROM(quizzes.category)) FROM quizzes;"
        @quiz_categories = ActiveRecord::Base.connection.execute(quiz_categories_sql)
    end 

    def new 
        @quiz = Quiz.new
        respond_to do |format|
            format.html { render "new" }
        end 
    end 

    def create
        if params[:commit] === "check_quiz_name"
            respond_to do |format|
                format.json { render json: Quiz.check_name(params[:quiz_name]).to_json }
            end 
        else 
            @quiz = Quiz.new(quiz_params)
            QuizCategory.where(category: @quiz.category).first_or_create
            if @quiz.save!
                redirect_to quiz_path(@quiz.id) 
            else 
                render "new"
            end 
        end 
    end

    def show
        Score.set_quiz_id(session, params[:id])
        @quizContent = Quiz.getQuizContent(params[:id])  
        @quiz = Quiz.find(params[:id])
        @takeQuiz = false 
        if @quizContent[:questions].length() > 0
            @takeQuiz = true 
        end 
        if session[:user_id]
            @highScore = Score.eval_highest_score(session[:quiz_id], session[:user_id])
            respond_to do |format|
                format.html { render "show" }
                format.json { render json: { quizContent: @quizContent, quiz: @quiz, auth: true } }
            end 
        else 
            respond_to do |format|
                format.html { render "show" }
                format.json { render json: { quizContent: @quizContent, quiz: @quiz, auth: false } }
            end 
        end 
    end 

    def edit  
        @quiz = Quiz.find(params[:id])
    end 
    
    def update 
        Quiz.updateQuiz(params)
        redirect_to quiz_path(params[:id])
    end     

    def destroy 
        Quiz.deleteQuiz(params[:id], session[:user_id])
        respond_to do |format|
            format.js { render "quizzes/js/delete_quiz"}
            format.json { render json: { status: true, message: "Quiz And All Associated Questions Deleted Successfully!", redirect: "/" } }
        end     
    end 

    def save_score 
        new_score= Score.create(:user_id => session[:user_id], :quiz_id => params[:quiz_id], :score => params[:score])
        new_score.save!
        respond_to do |format|
            format.json { render json: { status: "Score Saved" } }
        end
    end 

    def search_quizzes
        search_quizzes_sql = "SELECT quizzes.name, quizzes.id FROM quizzes WHERE name LIKE '%#{params[:quiz_name]}%'"
        result = ActiveRecord::Base.connection.execute(search_quizzes_sql)
        
        respond_to do |format|
            format.json { render json: { status: "Testing1", result: result } }
        end 
    end 

    private 
    def quiz_params
        params.require(:quiz).permit(:name, :category, :description, :contains_images)
    end
end
