class UserController < ApplicationController
    protect_from_forgery

    def user_login 
      render "user/user_login"
    end 

    def create 
      @user = User.authenticate(params[:username], params[:password])
      if @user 
        puts "user authentication successful"
        session[:username] = @user.username
        session[:user_id] = @user.id
        user_profile
      else 
        puts "user authentication failed"
        flash[:notice] = "Invalid login credentials"
        user_login
      end 

    end 

    def user_register
      puts params[:username]
      puts params[:email]
      puts params[:password]
      puts params[:password_confirmation]
      puts params[:fullName]
      puts params[:bio]
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