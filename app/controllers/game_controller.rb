class GameController < ApplicationController
    def new 

    end 

    def next_quiz 

    end 

    def level
   
        @collection = Collection.find(params[:collection_select])
        
        @quizzes = Quiz.where(collection_id: params[:collection_select])
        @quiz = @quizzes[0]
        @questions = Answer.where(quizId: @quiz.id)
        respond_to do | format |
            format.html { render "game/stage" }
            format.js { render "game/stage" }
        end 
    end 
end