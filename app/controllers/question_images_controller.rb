class QuestionImagesController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }
    def new 
    end 

    def create
        get_max_question_id = "SELECT MAX(id) AS max_id FROM questions;"
        get_max_question_sql = ActiveRecord::Base.connection.execute(get_max_question_id)
        Rails.logger.info get_max_question_sql
        
        # question_image = QuestionImage.create(:quiz_id => session[:quiz_id], :question_id => )
        # question_image.upload_image(params[:question_image])
        # question_image.
        # respond_to do |format|
        #     format.json { render json: {status: true, message: "Image Uploaded Successfully!" } }
        # end 
    end 
end
