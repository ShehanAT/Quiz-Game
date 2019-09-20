class Question < ApplicationRecord
    validates :answerId, presence: true
    validates :question, presence: true
end
