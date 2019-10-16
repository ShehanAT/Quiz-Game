class QuestionImagesController < ApplicationController

    def new 
    end 

    def create
        Rails.logger.info params
        # question_image = QuestionImage.create 
        # question_image.upload_image(params[:question_image])
    end 
end
