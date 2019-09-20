class GameController < ApplicationController
    def new 

    end 

    def next_quiz 

    end 

    def start
        Rails.logger.info "The param collection_id is #{params[:collection_select]}"
        @collection = Collection.find(params[:collection_select])
        
        @quizzes = Quiz.where(collection_id: params[:collection_select])
        @quiz = @quizzes[0]
        @questions = Question.where(quizId: @quiz.id)
        render "game/stage"
    end 

    def levelUp
        render "game/stage"
    end 
end