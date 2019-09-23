class Session < ApplicationRecord
    validates :quizId, presence: true
    validates :userId, presence: true
    validates :highScore, presence: true
    
end 