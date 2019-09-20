class Quiz < ApplicationRecord
    validates :answerId, presence: true, :numericality => true
    validates :collection_id, presence: true
    belongs_to :collection
end
