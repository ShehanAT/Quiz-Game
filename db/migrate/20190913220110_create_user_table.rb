class CreateUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :fullName
      t.text :bio 
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
