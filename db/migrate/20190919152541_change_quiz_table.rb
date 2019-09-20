class ChangeQuizTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :quizzes, :question
    remove_column :quizzes, :answer
    remove_column :quizzes, :first_choice
    remove_column :quizzes, :second_choice
    remove_column :quizzes, :third_choice
    remove_column :quizzes, :fourth_choice
    remove_column :quizzes, :correct_choice

    add_column :quizzes, :answerId, :integer
  end
end
