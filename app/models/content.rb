class Content < ApplicationRecord

    def self.addQuizContent(questionArr, current_quiz_id)
        # quiz = Quiz.find(1)
        parse_questionArr = JSON.parse(questionArr)
        for i in 0...parse_questionArr.length() do 
            Question.create(:question => parse_questionArr["#{i}"]["question"], :quiz_id => current_quiz_id)
            Answer.create(:answer => parse_questionArr["#{i}"]["answer1"], :quiz_id => current_quiz_id)
            Answer.create(:answer => parse_questionArr["#{i}"]["answer2"], :quiz_id => current_quiz_id)
            Answer.create(:answer => parse_questionArr["#{i}"]["answer3"], :quiz_id => current_quiz_id)
            Answer.create(:answer => parse_questionArr["#{i}"]["answer4"], :quiz_id => current_quiz_id, :correct_answer => )
        end 
    end 

    def self.getQuizContent(quiz_id)
        quiz = Quiz.find(quiz_id)
        questions = Question.where(quiz_id: quiz_id) 
        answers = Answer.where(quiz_id: quiz_id) 
        quizInfo = {quiz: quiz, questions: questions, answers:answers}
        return quizInfo
    end
   
end 
