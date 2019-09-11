class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.integer :quiz_id
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
