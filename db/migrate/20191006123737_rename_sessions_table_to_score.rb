class RenameSessionsTableToScore < ActiveRecord::Migration[6.0]
  def change
    rename_table :sessions, :scores 
  end
end
