class Score < ApplicationRecord
    validates :user_id, presence: true
    def self.eval_highest_score(quiz_id, user_id)
        get_high_score = "SELECT MAX(scores.score) FROM scores WHERE quiz_id='#{quiz_id}' AND user_id='#{user_id}';"
        result = ActiveRecord::Base.connection.execute(get_high_score)
        high_score = result[0]["MAX(scores.score)"]
        if high_score
            return high_score
        else 
            return 0
        end 
    end 

    def self.set_quiz_id(session, quiz_id)
        session[:quiz_id] = quiz_id
    end 
end 