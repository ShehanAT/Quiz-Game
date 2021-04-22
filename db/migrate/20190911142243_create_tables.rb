class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :category
      t.integer :total_quizzes
      t.timestamps
    end
    create_table :quizzes do |t|
      t.string :question
      t.string :answer
      t.integer :collection_id, null: false
      t.timestamps
    end
  end
end
