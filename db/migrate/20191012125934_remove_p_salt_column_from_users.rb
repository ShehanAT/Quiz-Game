class RemovePSaltColumnFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :p_salt, :string
  end
end
