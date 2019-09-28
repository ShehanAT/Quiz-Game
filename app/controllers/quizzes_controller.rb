class QuizzesController < ApplicationController

    def index 
        @quizzes = Quiz.all    
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

end
