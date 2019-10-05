class RemoveTotalQuestionsColumnFromQuizzesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :quizzes, :total_questions
    remove_column :answers, :answer_id
    remove_column :answers, :quiz_id
    remove_column :questions, :answer_id
    remove_column :questions, :question_id
    add_column :answers, :correct_answer, :integer
  end
end
