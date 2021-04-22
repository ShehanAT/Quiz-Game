class Question < ApplicationRecord
    validates :quiz_id, presence: true, :numericality => true
    belongs_to :quiz

    def self.updateQuestion(params)
        question = Question.find(params[:id])
        quiz_id = question.quiz_id
        question.update(question: params[:question])
        question.save!
        answers = JSON.parse(params[:answers])
        for i in 0...4
            answer = Answer.find(answers[i]["id"])
            answer.update(answer: params[:"answer#{i+1}"])
            if params[:"#{i+1}"] === "1"
                answer.update(correct_answer: 1)
            else 
                answer.update(correct_answer: 0)
            end 
            answer.save!
        end 
        if params[:question_image]
            image = QuestionImage.find_by(quiz_id: quiz_id, question_id: params[:id])
            image.upload_image(params[:question_image]) 
        end 
    end

    def self.deleteQuestion(question_id, quiz_id)
        Question.destroy(question_id)
        delete_answers_sql = "DELETE FROM answers WHERE question_id=#{question_id} AND quiz_id=#{quiz_id}"
        ActiveRecord::Base.connection.execute(delete_answers_sql)
    end 


end
