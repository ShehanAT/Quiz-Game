class Question < ApplicationRecord
    validates :answerId, presence: true, :numericality => true
    validates :quiz_id, presence: true
    belongs_to :quiz
end
