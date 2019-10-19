
class Quiz < ApplicationRecord
    has_many :question
    validates :name, presence: true
    validates :category, presence: true


    def self.addImageQuizContent(params, current_quiz_id)
        get_max_question_id = "SELECT MAX(id) AS max_id FROM questions;"
        get_max_question_sql = ActiveRecord::Base.connection.execute(get_max_question_id)
        new_question_id = get_max_question_sql[0]["max_id"].to_i + 1
        question = Question.create(:id => new_question_id, :quiz_id => current_quiz_id, :question => params[:question])
        question_image = QuestionImage.create(:quiz_id => current_quiz_id, :question_id => new_question_id)
        question_image.upload_image(params[:question_image])
        answer1 = Answer.create(:quiz_id => current_quiz_id, :question_id => new_question_id, :answer => params[:answer1], :correct_answer => 0)
        answer2 = Answer.create(:quiz_id => current_quiz_id, :question_id => new_question_id, :answer => params[:answer2], :correct_answer => 0)
        answer3 = Answer.create(:quiz_id => current_quiz_id, :question_id => new_question_id, :answer => params[:answer3], :correct_answer => 0)
        answer4 = Answer.create(:quiz_id => current_quiz_id, :question_id => new_question_id, :answer => params[:answer4], :correct_answer => 0)
        case params[:correct_answer]
            when "1"
                answer1.correct_answer = 1
                answer1.save!
            when "2"
                answer2.correct_answer = 1
                answer2.save!
            when "3"
                answer3.correct_answer = 1
                answer3.save!
            when "4"
                answer4.correct_answer = 1
                answer4.save!
            else     
        end 
    end 

    def self.addTextQuizContent(params, current_quiz_id)
        get_max_question_id = "SELECT MAX(id) AS max_id FROM questions;"
        get_max_question_sql = ActiveRecord::Base.connection.execute(get_max_question_id)
        new_question_id = get_max_question_sql[0]["max_id"].to_i + 1
        question = Question.create(:id => new_question_id, :quiz_id => current_quiz_id, :question => params[:question])
        answer1 = Answer.create(:quiz_id => current_quiz_id, :question_id => new_question_id, :answer => params[:answer1], :correct_answer => 0)
        answer2 = Answer.create(:quiz_id => current_quiz_id, :question_id => new_question_id, :answer => params[:answer2], :correct_answer => 0)
        answer3 = Answer.create(:quiz_id => current_quiz_id, :question_id => new_question_id, :answer => params[:answer3], :correct_answer => 0)
        answer4 = Answer.create(:quiz_id => current_quiz_id, :question_id => new_question_id, :answer => params[:answer4], :correct_answer => 0)
        case params[:correct_answer]
            when "1"
                answer1.correct_answer = 1
                answer1.save!
            when "2"
                answer2.correct_answer = 1
                answer2.save!
            when "3"
                answer3.correct_answer = 1
                answer3.save!
            when "4"
                answer4.correct_answer = 1
                answer4.save!
            else     
        end 
    end 

    def self.getQuizContent(quiz_id)
        quiz = Quiz.find(quiz_id)
        questions = Question.where(quiz_id: quiz_id) 
        answers = Answer.where(quiz_id: quiz_id) 
        if quiz.contains_images === 1
            question_images = QuestionImage.where(quiz_id: quiz_id)
        elsif quiz.contains_images === 0
            question_images = false
        end 
        quizInfo = {quiz: quiz, questions: questions, answers:answers, questionImages: question_images}
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
    

