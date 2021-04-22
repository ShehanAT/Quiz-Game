class AddQuizIdToQuestionImagesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :question_images, :quiz_id, :integer
  end
end
