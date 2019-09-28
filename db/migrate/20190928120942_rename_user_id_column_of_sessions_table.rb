class RenameUserIdColumnOfSessionsTable < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do 
        rename_column :sessions, :userId, :user_id
        rename_column :sessions, :quizId, :quiz_id
      end 
      dir.down do 
        rename_column :sessions, :use
      end 
    end 
  end
end
