class GamesController < ApplicationController
    def new 
    end 

    def next_quiz 
    end 

    def start_game 
        Rails.logger.info "THE START_GAME FORMAT IS #{request.format}"
        session[:collection_select] = params[:collection_select]
        collection = Collection.find(session[:collection_select])
        total_quizzes = collection.total_quizzes - 1
        quiz_order = (0..total_quizzes).to_a.shuffle
        session[:quiz_order] = quiz_order
        # if request.format === "text/html"
        @current_quiz_id = session[:quiz_order].pop
        getData
        render_quiz
        # end 
    end 

   

    def create
        if request.format === "application/json"
            pop_array 
        end
        checkData 
        getData
        render_quiz
    end 

    def checkData 
        session[:currentQuizId] = params[:quizId]
        session[:currentAnswerId] = params[:answerId]
        quizId = session[:currentQuizId]
        answerId = session[:currentAnswerId]
        if quizId && answerId
            quiz = Quiz.find(quizId)
            answer = Answer.find(answerId)
            if quiz.answerId === answer.answerId
                # Rails.logger.info "Correct Answer Selected"
            else 
                # Rails.logger.info "Wrong Answer Selected"
                nil
            end
        else 
            nil
        end   
    end 

    def pop_array 
        if session[:quiz_order].length != 0
            @current_quiz_id = session[:quiz_order].pop
        end 
    end 

    def end_game 
        render "game/end"
    end 

    def getData
        session[:quiz_order].each do |id|
            Rails.logger.info "#{id}"
        end 
        Rails.logger.info "THE CURRENT QUIZ ID IS #{@current_quiz_id}"
        quizzes = Quiz.where(collection_id: session[:collection_select])
        if @current_quiz_id 
            @quiz = quizzes[@current_quiz_id]
        else 
            @quiz = Quiz.find(1)
        end 
        @answers = Answer.where(quizId: @quiz.id)
    end 

    def render_quiz 
        respond_to do |format|
            format.json { render json: { quiz: @quiz, answers: @answers }}
            format.html { render "game/stage" }
            format.js { render "game/stage", :locals => { :quiz => @quiz, :answers => @answers }}
            
        end 
    end 

end