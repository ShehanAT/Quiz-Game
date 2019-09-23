class Session < ApplicationRecord
    validates :userId, presence: true
    validates_uniqueness_of :userId
end 