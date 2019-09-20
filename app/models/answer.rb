class Answer < ApplicationRecord
    validates :answerId, presence: true, :numericality => true
    validates :answer, presence: true
end
