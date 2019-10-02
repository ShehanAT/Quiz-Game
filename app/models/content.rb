class Content < ApplicationRecord

    def self.addQuizContent(questionArr)
        questionArr.each do |question|
            Rails.logger.info "#{question}"
        end 

    end 






end 
