class Question < ApplicationRecord
    validates :answerId, presence: true, :numericality => true
    validates :question, presence: true
end
