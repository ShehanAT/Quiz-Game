class SessionController < ApplicationController

    
    def login  
    end 

    def guest_user
        @guest_user = User.create(params[:guest_user])
        session[:guest_user_id] = @guest_user.id
        redirect_to "start_quiz/welcome"
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
      
 
end
