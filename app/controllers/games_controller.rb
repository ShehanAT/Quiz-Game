class GamesController < ApplicationController
    def new 
    end 

    def next_quiz 
    end 

    def start_game 
        session[:collection_select] = params[:collection_select]
        collection = Collection.find(session[:collection_select])
        total_quizzes = collection.total_quizzes - 1
        quiz_order = (0..total_quizzes).to_a.shuffle
        session[:quiz_order] = quiz_order
        @current_quiz_id = session[:quiz_order].pop
        getData
        render_quiz
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
                flash[:notice] = "Correct Answer!"
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
            @current_quiz_id 
        else 
            nil 
        end 
    end 

    def getData
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
            format.json { render json: { quiz: @quiz, answers: @answers, :quizzesLeft => session[:quiz_order].length } }
            format.html { render "game/stage" }
            format.js { render "game/stage" }
        end 
    end 

end