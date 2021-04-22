# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

    def user_mailer_preview  
        UserMailer.password_reset(User.first)
    end 
end
