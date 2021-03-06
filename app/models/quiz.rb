
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

    def self.deleteQuiz(quiz_id, user_id)
        quiz = Quiz.find(quiz_id)
        quiz_category = quiz.category 

        delete_all_questions_sql = "DELETE FROM questions WHERE quiz_id='#{quiz_id}'"
        ActiveRecord::Base.connection.execute(delete_all_questions_sql)
        delete_all_answers_sql = "DELETE FROM answers WHERE quiz_id='#{quiz_id}'"
        ActiveRecord::Base.connection.execute(delete_all_answers_sql)

        quiz.destroy 

        check_category_sql = "SELECT * FROM quizzes WHERE category='#{quiz_category}'"
        result = ActiveRecord::Base.connection.execute(check_category_sql)
        if result.num_tuples.zero? 
            category = QuizCategory.find_by_category(quiz_category)
            category.destroy
        end 
        
        delete_scores_sql = "DELETE FROM scores WHERE quiz_id=#{quiz_id} AND user_id=#{user_id}"
        ActiveRecord::Base.connection.execute(delete_scores_sql)

    end 

    def self.updateQuiz(params)
        quiz = Quiz.find(params[:id])

        previous_category = quiz.category

        quiz.update(name: params[:quiz_name])
        quiz.update(category: params[:quiz_category])
        quiz.update(description: params[:quiz_description])

        new_category = quiz.category

        QuizCategory.where(category: new_category).first_or_create

        check_category_sql = "SELECT * FROM quizzes WHERE category='#{previous_category}'"
        result = ActiveRecord::Base.connection.execute(check_category_sql)
        if result.num_tuples.zero? 
            category = QuizCategory.find_by_category(previous_category)
            category.destroy
        end 
        
        quiz.save!
    end 

    def self.check_valid_new(quiz_name, quiz_category)
        if quiz_name[0] == " "
            return { status: false, message: "Quiz Name Cannot Contain Leading Whitespace!" }
        end 
        if quiz_name[-1] == " "
            return { status: false, message: "Quiz Name Cannot Contain Trailing Whitespace!" }
        end 
        if quiz_category
            if quiz_category[0] == " "
                return { status: false, message: "Quiz Category Cannot Contain Leading Whitespace!" }
            end 
            if quiz_category[-1] == " "
                return { status: false, message: "Quiz Category Cannot Contain Trailing Whitespace!" }
            end 
        end 
        quiz_sql = "SELECT * FROM quizzes WHERE name='#{quiz_name}' LIMIT 1"
        quiz = ActiveRecord::Base.connection.execute(quiz_sql)
        if quiz.num_tuples.zero? 
            return { status: true, message: "Valid Quiz Name" }
        else 
            return { status: false, message: "A Quiz With The Same Name Already Exists!"}
        end 
    end 

    def self.check_valid_update(quiz_id, quiz_name, quiz_category)
        quiz = Quiz.find(quiz_id)
        if quiz_name[0] == " "
            return { status: false, message: "Quiz Name Cannot Contain Leading Whitespace!" }
        end 
        if quiz_name[-1] == " "
            return { status: false, message: "Quiz Name Cannot Contain Trailing Whitespace!" }
        end 
        if quiz_category[0] == " "
            return { status: false, message: "Quiz Category Cannot Contain Leading Whitespace!" }
        end 
        if quiz_category[-1] == " "
            return { status: false, message: "Quiz Category Cannot Contain Trailing Whitespace!" }
        end 
        quiz_sql = "SELECT * FROM quizzes WHERE name='#{quiz_name}' LIMIT 1"
        quiz_result = ActiveRecord::Base.connection.execute(quiz_sql)
        if quiz_result.num_tuples.zero?
            return { status: true }
        else 
            if quiz_result[0]["name"] == quiz["name"]
                return { status: true }
            else 
                return { status: false, message: "A Quiz With The Same Name Already Exists!" }
            end 
        end 
    end 
end
    

