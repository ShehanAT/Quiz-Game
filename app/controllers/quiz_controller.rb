class QuizController < ApplicationController


    def new_quiz 
        quizName = params[:name]
        quizCategory = params[:category]
        totalQuestions = params[:total_questions]
        @quiz = Quiz.create(:name => quizName, :category => quizCategory, :total_questions => totalQuestions)
        if @quiz.save
            Rails.logger.info "Quiz was saved"
        else 
            Rails.logger.info "Quiz was not saved"
        end 
        render "/quiz/new_quiz"
    end 

    def show_quiz_by_id
        @quiz = Quiz.find(params[:id])
        @questionsInQuiz = Question.where(quiz_id: Quiz.pluck(:id))
        render "quiz/show_quiz"
    end
    
    def delete_quiz_by_id
        @quiz = Quiz.find(params[:id])
        if @quiz.delete
            Rails.logger.info "Quiz was deleted"
        else 
            Rails.logger.info "Quiz was not deleted"
        end 
    end 

    def update_quiz_by_id  
        updateField = params[:update]
        updateValue = params[:newValue]
        @quiz = Quiz.find(params[:id])
        @questionsInQuiz = Question.where(quiz_id: Quiz.pluck(:id))
        if @quiz[updateField] = updateValue
            Rails.logger.info "Quiz was updated"
        else 
            Rails.logger.info "Quiz was not updated"
        end 
        render "quiz/show_quiz"
    end 
end
