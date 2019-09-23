class RenameCollectionAndQuizTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :quizzes, :questions
    rename_table :collections, :quizzes
    rename_column :questions, :collection_id, :quiz_id
    rename_column :quizzes, :total_quizzes, :total_questions
    change_column :questions, :created_at, :integer, :default => Time.now
    change_column :questions, :updated_at, :integer, :default => Time.now
    change_column :quizzes, :created_at, :integer, :default => Time.now
    change_column :quizzes, :updated_at, :integer, :default => Time.now
  end
end
