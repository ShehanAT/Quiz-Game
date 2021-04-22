class UserMailer < ApplicationMailer
    default from: "shehanatukorala@gmail.com"
    
    def password_reset(user)
        @user = user 
        mail :to => user.email, :subject => "Password Reset"
    end 
end
