class Question < ApplicationRecord
    validates :quiz_id, presence: true, :numericality => true
    belongs_to :quiz

    def self.updateQuestion(params)
        question = Question.find(params[:question][:id])
        question.update(question: params[:question][:value])
        question.save!
        for i in 0...4
            answer = Answer.find(params[:"answer#{i+1}"][:id])
            answer.update(answer: params[:"answer#{i+1}"][:value])
            if answer.id === params[:correct_answer].to_i
                answer.update(correct_answer: 1)
            else 
                answer.update(correct_answer: 0)
            end 
            answer.save!
        end 

    end

    def self.deleteQuestion(question_id)
        Question.destroy(question_id)
    end 


end
