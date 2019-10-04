class Question < ApplicationRecord
    validates :quiz_id, presence: true, :numericality => true
    belongs_to :quiz
end
