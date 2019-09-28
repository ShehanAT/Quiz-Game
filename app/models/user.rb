
class User < ApplicationRecord
    validates_presence_of :username, :fullName, :bio
    validates_uniqueness_of :username 
    validates_uniqueness_of :email
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }
    before_save :encrypt_password

    def self.authenticate(username, password)
        user = User.find_by_username(username)
        
        if user && user.password === BCrypt::Engine.hash_secret(password, user.p_salt)
            user
        else 
            nil
        end 
    end 

    def encrypt_password 
        password_salt = BCrypt::Engine.generate_salt
        if hashed_password = BCrypt::Engine.hash_secret(password, password_salt)
            self.password = hashed_password 
            self.p_salt = password_salt
        else 
            nil
        end 
    end 

  
end
