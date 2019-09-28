class QuizzesController < ApplicationController

    def index 
        @quizzes = Quiz.all   
        respond_to do |format|
            format.js { render "index" }
            format.html { render "index" }
        end 
    end 

    def new 
    end 

    def create 
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
        user_id = session[:user_id]
        quiz_id = params[:quiz_id]
        score = params[:score]
        old_session = Session.where(user_id: user_id).take
        if old_session
            update_status = old_session.eval_highest_score(score)
            respond_to do |format|
                format.json { render json: { status: update_status}}
            end 
        else 
            new_session = Session.create(:user_id => user_id, :quiz_id => quiz_id, :highScore => score)
            respond_to do |format|
                format.json { render json: { status: "High Score Saved" } }
            end
        end
    end 
end
