class Content < ApplicationRecord

    def self.addQuizContent(questionArr, current_quiz_id)
        quiz = Quiz.find(1)
        Rails.logger.info "#{quiz}"
        Rails.logger.info "passing"
        parsed_quizzes = JSON.parse(quiz.quizzes)
        Rails.logger.info "#{parsed_quizzes}"
        # data = JSON.parse(questionArr)
        # Rails.logger.info "QUESTIONARR: #{questionArr}"
        # data.each do |question|
        #     current_quiz = Quiz.find(current_quiz_id)
        #     current_quiz.total_questions = current_quiz.total_questions.to_i + 1
        #     current_quiz.save
        #     question.each do |key, value|
        #         Rails.logger.info "ANSWER 1 IS: #{question[1]["question"]}"
        #         new_question = Question.new(:question => key["question"], :quiz_id => current_quiz_id, :answer_id => key["correctAnswer"].to_i, :question_id => current_quiz.total_questions)
        #         answer_1 = Answer.new(:answer => question[1]["answer1"], :quiz_id => current_quiz_id, :answer_id => 1, :question_id => current_quiz.total_questions)
        #         answer_2 = Answer.new(:answer => question[1]["answer2"], :quiz_id => current_quiz_id, :answer_id => 2, :question_id => current_quiz.total_questions)
        #         answer_3 = Answer.new(:answer => question[1]["answer3"], :quiz_id => current_quiz_id, :answer_id => 3, :question_id => current_quiz.total_questions)
        #         answer_4 = Answer.new(:answer => question[1]["answer4"], :quiz_id => current_quiz_id, :answer_id => 4, :question_id => current_quiz.total_questions)
               
        #         if new_question.save!
        #             Rails.logger.info "new question save successful"
        #         else
        #             Rails.logger.info "new question save failed"
        #         end 
        #     end 
        #     answer_1.save!
        #     answer_2.save!
        #     answer_3.save!
        #     answer_4.save!
    end 

    def self.getQuizContent(quiz_id)
        quiz = Quiz.find(quiz_id)
        questions = Question.where(quiz_id: quiz_id) 
        answers = Answer.where(quiz_id: quiz_id) 
        quizInfo = {quiz: quiz, questions: questions, answers:answers}
        return quizInfo
    end
   
end 
