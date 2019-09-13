class Collection < ApplicationRecord
    has_many :quiz
    validates :name, presence: true
    validates :category, presence: true
    validates :total_quizzes, presence: true
end
