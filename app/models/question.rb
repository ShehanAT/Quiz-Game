class Question < ApplicationRecord
    validates :answer_id, presence: true, :numericality => true
    validates :quiz_id, presence: true
    belongs_to :quiz
end
