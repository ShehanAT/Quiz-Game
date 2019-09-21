class GamesController < ApplicationController
    def new 

    end 

    def next_quiz 

    end 

    def create
        quizId = params[:quizId]
        answerId = params[:answerId]
        if quizId && answerId
            quiz = Quiz.find(quizId)
            answer = Answer.find(answerId)
            if quiz.answerId === answer.answerId
                Rails.logger.info "Correct Answer Selected"
            end 
        else 
            session[:collection_select] = params[:collection_select]
        end
        Rails.logger.info "Session Collection_Select is #{session[:collection_select]}" 
        @collection = Collection.find(session[:collection_select])
        @quizzes = Quiz.where(collection_id: session[:collection_select])
        @quiz = @quizzes[0]
        @answers = Answer.where(quizId: @quiz.id)
        render "game/stage"
    end 

end