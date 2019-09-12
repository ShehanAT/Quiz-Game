class Quiz < ApplicationRecord
    validates :question, presence: true
    validates :answer, presence: true
    belongs_to :collection
end
