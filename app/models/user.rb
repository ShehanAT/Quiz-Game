require 'digest/sha1'
class User < ApplicationRecord
    validates_presence_of :username, :email, :password, :fullName, :bio 
    validates_uniqueness_of :email

    attr_accessor :username, :email, :password, :fullName, :bio 


    def self.authenticate(username, password)
        user = User.find_by_username(username)
        if user && user.password_hash === BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else 
            nil
        end 
    end 

    def encrypt_password(password) 
        if password.present?
            password_salt = BCrypt::Engine.generate_salt
            password_hash = BCrypt::Engine.hash_secret(password, password_salt)
            if password_hash
                password_hash
            else 
                nil
            end 
        end 
    end 
end
