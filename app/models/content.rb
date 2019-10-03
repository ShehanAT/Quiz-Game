class Content < ApplicationRecord

    def self.addQuizContent(questionArr, current_quiz_id)
        data = JSON.parse(questionArr)
        Rails.logger.info "JSON: #{data}"
        data.each do |question|
            current_quiz = Quiz.find(current_quiz_id)
            current_quiz.total_questions = current_quiz.total_questions.to_i + 1
            current_quiz.save
            question.each do |key, value|
                new_question = Question.new(:question => key["question"], :quiz_id => current_quiz_id, :answer_id => key["correctAnswer"].to_i, :question_id => current_quiz.total_questions)
                if new_question.save!
                    Rails.logger.info "new question save successful"
                else
                    Rails.logger.info "new question save failed"
                end 
            end 
        end 

    end 






end 
