class CreateUserTable < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do 
        create_table :users do |t|
          t.string :username,    null: false, default: ""
          t.string :email,       null: false, default: ""
          t.string :password,    null: false, default: ""
          t.string :p_salt
          t.string :fullName
          t.text :bio 

          t.timestamps
        end
      end 
      dir.down do 
        drop_table :users
      end 
    end 
  end
end
