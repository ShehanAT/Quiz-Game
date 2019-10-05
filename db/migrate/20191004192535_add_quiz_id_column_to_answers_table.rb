class AddQuizIdColumnToAnswersTable < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do 
        add_column :answers, :quiz_id, :integer
      end 

      dir.down do 
        remove_column :answers, :quiz_id
      end 
    end 
  end
end
