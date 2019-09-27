class AddDescriptionColumnToQuizzesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :description, :string
  end
end
