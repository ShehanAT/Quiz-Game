class GamesController < ApplicationController
    def new 
    end 

    def next_quiz 
    end 

    def create
        if !session[:collection_select]
            session[:collection_select] = params[:collection_select]
        end 
        session[:currentQuizId] = params[:quizId]
        session[:currentAnswerId] = params[:answerId]
        checkData
        getData
    end 

    def checkData 
        quizId = session[:currentQuizId]
        answerId = session[:currentAnswerId]
        if quizId && answerId
            quiz = Quiz.find(quizId)
            answer = Answer.find(answerId)
            if quiz.answerId === answer.answerId
                Rails.logger.info "Correct Answer Selected"
            else 
                Rails.logger.info "Wrong Answer Selected"
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
        @quiz = @quizzes[random_quiz_id - 1]
        @answers = Answer.where(quizId: @quiz.id)
        respond_to do |format|
            format.html { render "game/stage" }
            format.js { render "game/stage" }
            format.json { render json: { quiz: @quiz, answers: @answers }}
        end 
    end 

end