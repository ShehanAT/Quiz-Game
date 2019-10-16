require "google/cloud/storage"

class QuestionImage < ApplicationRecord

    def self.storage_bucket
        @storage_bucket ||= begin
          config = Rails.application.config.x.settings
          storage = Google::Cloud::Storage.new project_id: ENV["GCP_PROJECT_ID"],
                                               credentials: ENV["GCP_KEYFILE_PATH"]
          storage.bucket ENV["GSC_BUCKET"]
        end
    end

    def upload_image(question_image)
        file = QuestionImage.storage_bucket.create_file \
          question_image.tempfile,
          "images/#{id}/#{question_image.original_filename}",
          content_type: question_image.content_type,
          acl: "public"
    
        Rails.logger.info file.public_url
        update_columns image_url: file.public_url
      end
end
