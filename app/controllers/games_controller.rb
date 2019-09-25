class GamesController < ApplicationController
    def new 
    end 

    def start_game 
        if session[:quiz_select]
            if !session[:guest_user_id] && session[:user_id]
                game_session = Session.find_by_userId(session[:user_id])
                game_session.quizId = session[:quiz_select]
                game_session.save!
            end     
        total_questions = Quiz.find(session[:quiz_select]).total_questions - 1
        question_order = (0..total_questions).to_a.shuffle
        session[:question_order] = question_order
        session[:score] = 0
        @current_question_id = session[:question_order].pop
        getData
        render_quiz
        else 
            redirect_to "/quiz_error"
        end 

    end 

    def quiz_error 
        render "game/error"
    end 

    def create
        Rails.logger.info "THE QUESTION ID: #{params[:questionId]}"
        Rails.logger.info "THE ANSWER ID: #{params[:answerId]}"
        if request.format === "application/json"
            pop_array
        end
        checkData 
        getData
        render_quiz
    end 

    def next_quiz 
        checkData 
        getData
    end

    def checkData 
        question = Question.find(params[:questionId])
        answer = Answer.find(params[:answerId])
        if question.answerId === answer.answerId
            session[:score] += 10
        end
    end 

    def pop_array 
        if session[:question_order].length != 0
            @current_question_id = session[:question_order].pop
            @current_question_id 
        else 
            @gameOver = true
        end 
    end 

    def getData
        questions = Question.where(quiz_id: session[:quiz_select])
        if @current_question_id 
            @question = questions[@current_question_id]
        else 
            @question = Question.find(1)
        end 
        @answers = Answer.where(quizId: @question.id)
    end 

    def render_quiz 
        @start_quiz = Quiz.find(session[:quiz_select])
        respond_to do |format|
            format.json { render json: { question: @question, answers: @answers, gameOver: @gameOver, score: session[:score] } }
            format.html { render "game/stage" }
            format.js { render "game/stage" }
        end 
    end 


    def save_score
        userId = session[:user_id]
        highScore = session[:score]
        game_session = Session.find_by_userId(userId)
        if game_session 
            game_session.highScore = highScore
            game_session.save!
        end 
        return 
    end 
end