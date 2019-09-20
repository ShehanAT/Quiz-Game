class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :quizId
      t.string :question
      t.integer :answerId

      t.timestamps
    end
  end
end
