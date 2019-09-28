class Answer < ApplicationRecord
    validates :answer_id, presence: true, :numericality => true
    validates :answer, presence: true
end
