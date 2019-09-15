require 'digest/sha1'
class User < ApplicationRecord

    def self.authenticate(username, password)
        user = User.find_by_username(username)
        if user && user.password_hash === BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else 
            nil
        end 
    end 

    def encrypt_password 
        if password.present?
            password_salt = BCrypt::Engine.generate_salt
            password_hash = BCrypt::Engine.hash_secret(password, password_salt)
            user = User.create(:username => username, :password_hash => password_hash, :password_salt => password_salt, :email => email, :fullName => fullName, :bio => bio)
            if user.save!
                puts "User saved successfully"
            else 
                puts "User not saved"
            end 
        end 
    end 
end
