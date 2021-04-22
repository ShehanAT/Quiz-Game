class AddAuthTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :auth_token, :string
  end
end
