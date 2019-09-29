
class Quiz < ApplicationRecord
    has_many :question
    validates :name, presence: true
    validates :category, presence: true
    validates :total_questions, presence: true, numericality: { only_integer: true }
end
    

