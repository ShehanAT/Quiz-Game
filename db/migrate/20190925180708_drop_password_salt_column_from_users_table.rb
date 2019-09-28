class DropPasswordSaltColumnFromUsersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_salt, :string
  end
end
