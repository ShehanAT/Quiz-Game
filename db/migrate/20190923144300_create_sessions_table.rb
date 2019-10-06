class CreateSessionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table(:sessions, :primary_key => "session_id") do |t|
      t.integer :session_id, null: false
      t.integer :highScore 
      t.integer :userId 

      t.timestamps
    end
  end
end
