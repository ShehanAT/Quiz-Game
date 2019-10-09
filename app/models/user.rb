
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

    def self.change_username(username)
        saved_session = Session.all
        user = User.find(JSON.parse(saved_session[0].data)["value"]["user_id"])
        user.update(username: username)
        if user.save!
            return { message: "Username Updated Successfully", status: true }
        else 
            return { message: "Username Update Failed", status: false }
        end 
    end 

    def self.change_email(email)
        saved_session = Session.all 
        user = User.find(JSON.parse(saved_session[0].data)["value"]["user_id"])
        user.update(email: email)
        if user.save! 
            return { message: "Email Updated Successfully", status: true }
        else 
            return { message: "Email Update Failed", status: false }
        end 
    end 

    def self.change_fullName(fullName)
        saved_session = Session.all 
        user = User.find(JSON.parse(saved_session[0].data)["value"]["user_id"])
        user.update(fullName: fullName)
        if user.save! 
            return { message: "Full Name Updated Successfully", status: true }
        else 
            return { message: "Full Name Update Failed", status: false }
        end 
    end 

    def self.check_username(username)
        if username === ""
            return {
                message: "<span style='color: red;'>Username cannot be blank</span>",
                status: false
            }
        end 
        check_username_sql = "SELECT * FROM users WHERE username='#{username}'"
        results = ActiveRecord::Base.connection.execute(check_username_sql)
        if results.length() == 0
            return {
                message: "<span style='color: green;'>Username is valid</span>",
                status: true
            }
        else 
            return {
                message: "<span style='color: red;'>Username is already taken</span>",
                status: false 
            }
        end 
    end 


    def self.check_email(email)
        if email === ""
            return  {
                message: "<span style='color: red;'>Email cannot be blank</span>",
                status: false
            }
        end 
        check_email_sql = "SELECT * FROM users WHERE email='#{email}'"
        results = ActiveRecord::Base.connection.execute(check_email_sql)
        if !(!(email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i).nil?)
            return  {
                message: "<span style='color: red;'>Email is invalid</span>",
                status: false
            }
        elsif results.length() != 0
            return {
                message: "<span style='color: red;'>Email already taken</span>",
                status: false
            }
        else
            return {
                message: "<span style='color: green;'>Email is valid</span>",
                status: true
            }
        end 
    end 

end
