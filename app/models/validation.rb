class Validation < ApplicationRecord

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

    def self.update_password(params)
        Rails.logger.info "#{params}"
    end 
end
