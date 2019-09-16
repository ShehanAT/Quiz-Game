class UserController < ApplicationController
    protect_from_forgery


    def create 
      password_credentials = User.encrypt_password(params[:password])
      password_salt = password_credentials[0]
      password_hash = password_credentials[1]
      password_confirmation_hash = User.encrypt_password(params[:password_confirmation], password_salt)[1]
      user = User.create(
        :username => params[:username], 
        :email => params[:email],
        :password_salt => password_salt,
        :password => password_hash,
        :fullName => params[:fullName],
        :bio => params[:bio],
        :password_confirmation => password_confirmation_hash
        )
      if user.save! 
        puts "User saved"
        @userToRender = user 
        render "user/user_profile"
      else 
        puts "User not saved"
        
      end 
    end 

    def user_register
    
    end 
   

    def user_registration 
      @user = User.new
    end 

    def user_profile 
      guest_user
      render "user/user_profile"
    end 
    
  
    
    def logging_in
       
    end

    def create_guest_user 
       guest_user = FactoryBot.create(:guest_user)
    end 

   

end 