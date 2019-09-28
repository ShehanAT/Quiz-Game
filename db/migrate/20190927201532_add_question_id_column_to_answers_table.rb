class AddQuestionIdColumnToAnswersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :question_id, :string, default: false
    rename_column :answers, :quizId, :quiz_id
    rename_column :answers, :answerId, :answer_id
  end
end
