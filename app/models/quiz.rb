
class Quiz < ApplicationRecord
    has_many :question
    validates :name, presence: true
    validates :category, presence: true

    def self.addQuizContent(questionArr, current_quiz_id)
        parsed_questionArr = JSON.parse(questionArr)
        get_max_question_id = "SELECT MAX(id) AS max_id FROM questions;"
        get_max_question_sql = ActiveRecord::Base.connection.execute(get_max_question_id)
        question_id = get_max_question_sql[0]["max_id"].to_i + 1
        for i in 0...parsed_questionArr.length() do 
            Question.create(:question => parsed_questionArr["#{i}"]["question"], :quiz_id => current_quiz_id, :id => question_id)
            Answer.create(:answer => parsed_questionArr["#{i}"]["answer1"]["answer"], :quiz_id => current_quiz_id, :correct_answer => parsed_questionArr["#{i}"]["answer1"]["correct_answer"], :question_id => question_id)
            Answer.create(:answer => parsed_questionArr["#{i}"]["answer2"]["answer"], :quiz_id => current_quiz_id, :correct_answer => parsed_questionArr["#{i}"]["answer2"]["correct_answer"], :question_id => question_id)
            Answer.create(:answer => parsed_questionArr["#{i}"]["answer3"]["answer"], :quiz_id => current_quiz_id, :correct_answer => parsed_questionArr["#{i}"]["answer3"]["correct_answer"], :question_id => question_id)
            Answer.create(:answer => parsed_questionArr["#{i}"]["answer4"]["answer"], :quiz_id => current_quiz_id, :correct_answer => parsed_questionArr["#{i}"]["answer4"]["correct_answer"], :question_id => question_id)
            question_id += 1
        end 
    end 
    
    def self.getQuizContent(quiz_id)
        quiz = Quiz.find(quiz_id)
        questions = Question.where(quiz_id: quiz_id) 
        answers = Answer.where(quiz_id: quiz_id) 
        quizInfo = {quiz: quiz, questions: questions, answers:answers}
        return quizInfo
    end

    def self.deleteQuiz(quiz_id)
        Quiz.destroy(quiz_id)
    end 

    def self.updateQuiz(params)
        quiz = Quiz.find(params[:id])
        quiz.update(name: params[:quiz_name])
        quiz.update(category: params[:quiz_category])
        quiz.update(description: params[:quiz_description])
        quiz.save!
    end 


end
    

