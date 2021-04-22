class AddQuestionIdColumnToQuestionsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :question_id, :string, default: false
    rename_column :questions, :answerId, :answer_id
  end
end
