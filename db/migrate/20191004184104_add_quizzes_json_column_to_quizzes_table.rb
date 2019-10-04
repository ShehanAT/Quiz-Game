class AddQuizzesJsonColumnToQuizzesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :quizzes, :json, null: false, default: '{}'
  end
end
