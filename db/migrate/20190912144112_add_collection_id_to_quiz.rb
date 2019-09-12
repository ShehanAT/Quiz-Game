class AddCollectionIdToQuiz < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :collection_id, :integer
  end
end
