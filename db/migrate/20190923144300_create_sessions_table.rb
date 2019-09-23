class CreateSessionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :quizId
      t.integer :highScore 
      t.integer :userId 

      t.timestamps
    end
  end
end
