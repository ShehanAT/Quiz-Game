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
        @questions = Answer.where(quizId: @quiz.id)
        @questions.each do |answer| 
            Rails.logger.info "The question is #{answer.answer}"
        end 
        render "game/stage"
    end 

    def levelUp
        render "game/stage"
    end 
end