class ChangeUsersPasswordHash < ActiveRecord::Migration[6.0]
  def up
    rename_column :users, :password_hash, :password 
  end 

  def down 
    rename_column :users, :password_hash, :password 
  end
end
