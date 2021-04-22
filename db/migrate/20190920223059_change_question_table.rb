class ChangeQuestionTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :questions, :answers
    rename_column :answers, :question, :answer 
    add_column :quizzes, :question, :string
    # change_column :answers, :created_at, :integer, :default => :current_timestamp
  end
end
