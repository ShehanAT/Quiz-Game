class AddChoiceAndAnswerFieldsToQuiz < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :first_choice, :string 
    add_column :quizzes, :second_choice, :string 
    add_column :quizzes, :third_choice, :string
    add_column :quizzes, :fourth_choice, :string
    add_column :quizzes, :correct_choice, :string
  end
end
