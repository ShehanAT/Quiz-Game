class RenameCollectionAndQuizTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :quizzes, :questions
    rename_table :collections, :quizzes
    rename_column :questions, :collection_id, :quiz_id
    rename_column :quizzes, :total_quizzes, :total_questions
  end
end
