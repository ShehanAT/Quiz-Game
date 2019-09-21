class GamesController < ApplicationController
    def new 

    end 

    def next_quiz 

    end 

    def create
        if !session[:collection_select]
            session[:collection_select] = params[:collection_select]
        end 
        getData
        checkData
        render "game/stage"
    end 

    def checkData 
        quizId = params[:quizId]
        answerId = params[:answerId]
        if quizId && answerId
            quiz = Quiz.find(quizId)
            answer = Answer.find(answerId)
            if quiz.answerId === answer.answerId
                Rails.logger.info "Correct Answer Selected"
            else 
                nil
            end
        else 
            nil
        end   
    end 

    def getData 
        @collection = Collection.find(session[:collection_select])
        total_quizzes = @collection.total_quizzes
        @quizzes = Quiz.where(collection_id: session[:collection_select])
        random_quiz_id = rand(1..total_quizzes)
        while random_quiz_id === params[:quizId]
            random_quiz_id = rand(1..total_quizzes)
        end 
        Rails.logger.info "The random quiz id is #{random_quiz_id}"
        @quiz = @quizzes[random_quiz_id - 1]
        Rails.logger.info "The random quiz is #{@quiz}"
        @answers = Answer.where(quizId: @quiz.id)
    end 

end