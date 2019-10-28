class AddQuizIdColumnToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :quiz_id, :integer
  end
end
