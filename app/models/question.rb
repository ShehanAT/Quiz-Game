class Question < ApplicationRecord
    validates :quiz_id, presence: true, :numericality => true
    belongs_to :quiz

    def self.updateQuestion(params)
        question = Question.find(params[:question_id])
        question.update(question: params[:question])

        answer1 = Answer.find(params[:answer1_id])
        answer1.update(answer: params[:answer1])

        answer2 = Answer.find(params[:answer2_id])
        answer2.update(answer: params[:answer2])

        answer3 = Answer.find(params[:answer3_id])
        answer3.update(answer: params[:answer3])

        answer4 = Answer.find(params[:answer4_id])
        answer4.update(answer: params[:answer4])

        question.save!
        answer1.save!
        answer2.save!
        answer3.save!
        answer4.save!
    end

    def self.deleteQuestion(question_id)
        Question.destroy(question_id)
    end 


end
