require 'digest/sha1'
class User < ApplicationRecord
    validates_presence_of :username, :fullName, :bio 
    validates_uniqueness_of :email
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }
    # attr_accessor :username, :email, :password, :fullName, :bio 
    

    def self.authenticate(username, password)
        user = User.find_by_username(username)
        if user && user.password === BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else 
            nil
        end 
    end 

    def self.encrypt_password(password, confirm_password_salt = nil) 
        password_salt = BCrypt::Engine.generate_salt
        if confirm_password_salt
            password_hash = BCrypt::Engine.hash_secret(password, confirm_password_salt)
        else 
            password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end 
        if password_credentials = [password_salt, password_hash]
            password_credentials
        else 
            nil
        end 
    end 

  
end
