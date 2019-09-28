class Session < ApplicationRecord
    validates :user_id, presence: true
    validates_uniqueness_of :user_id

    def eval_highest_score(new_score)
        if new_score.to_i > self.highScore
            self.highScore = new_score 
            self.save!
            return "All Time High Score: #{self.highScore}"
        else 
            return "All Time High Score: #{self.highScore}" 
        end 
    end 
end 