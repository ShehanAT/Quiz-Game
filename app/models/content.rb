class Content < ApplicationRecord

    def self.addQuizContent(questionArr, current_quiz_id)
        parsed_questionArr = JSON.parse(questionArr)
        for i in 0...parsed_questionArr.length() do 
            get_max_question_id = "SELECT MAX(id) AS max_id FROM questions;"
            get_max_question_sql = ActiveRecord::Base.connection.execute(get_max_question_id)
            question_id = get_max_question_sql[0]["max_id"].to_i + 1
            Question.create(:question => parsed_questionArr["#{i}"]["question"], :quiz_id => current_quiz_id, :id => question_id)
            Answer.create(:answer => parsed_questionArr["#{i}"]["answer1"]["answer"], :quiz_id => current_quiz_id, :correct_answer => parsed_questionArr["#{i}"]["answer1"]["correct_answer"], :question_id => question_id)
            Answer.create(:answer => parsed_questionArr["#{i}"]["answer2"]["answer"], :quiz_id => current_quiz_id, :correct_answer => parsed_questionArr["#{i}"]["answer2"]["correct_answer"], :question_id => question_id)
            Answer.create(:answer => parsed_questionArr["#{i}"]["answer3"]["answer"], :quiz_id => current_quiz_id, :correct_answer => parsed_questionArr["#{i}"]["answer3"]["correct_answer"], :question_id => question_id)
            Answer.create(:answer => parsed_questionArr["#{i}"]["answer4"]["answer"], :quiz_id => current_quiz_id, :correct_answer => parsed_questionArr["#{i}"]["answer4"]["correct_answer"], :question_id => question_id)
        end 
    end 

    def self.getQuizContent(quiz_id)
        quiz = Quiz.find(quiz_id)
        questions = Question.where(quiz_id: quiz_id) 
        answers = Answer.where(quiz_id: quiz_id) 
        quizInfo = {quiz: quiz, questions: questions, answers:answers}
        return quizInfo
    end

    def self.updateQuestion(params)
        Rails.logger.info "CONTENT PARAMS: #{params}"
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
