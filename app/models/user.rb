
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
        if user 
            auth_password = BCrypt::Password.new(user.password)
            Rails.logger.info "AUTH PASSWORD #{auth_password}"
            if auth_password == password  then 
                return user
            else 
                return false
            end
        else 
            return false 
        end 
    end
    
    def self.change_password(current_password, new_password)
        saved_session = Session.all 
        user = User.find(JSON.parse(saved_session[0].data)["value"]["user_id"])
        if User.authenticate(user.username, current_password)
            new_hashed_password = BCrypt::Password.create(new_password)
            save_new_password = "UPDATE users SET password='#{new_hashed_password}' WHERE username='#{user.username}'"
            result = ActiveRecord::Base.connection.execute(save_new_password)
            if result
                return { message: "Password Updated Successfully", status: true }
            else 
                return { message: "Password Update Failed", status: false }
            end 
        else 
            return { message: "Entered Current Password Is Invalid", status: true } 
        end 
       
    end 

    def encrypt_password
        if hashed_password = BCrypt::Password.create(password)
            self.password = hashed_password
        else
            return nil
        end 
    end 

  
end
