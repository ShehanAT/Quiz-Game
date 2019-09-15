class UserController < ApplicationController
    protect_from_forgery

    def user_login 
      render "user/user_login"
    end 

    def create 
      @user = User.authenticate(params[:username], params[:password])
      if @user 
        session[:username] = @user.username
        session[:user_id] = @user.id
        redirect_to user_profile, :status => :redirect and return 
      else 
        puts "user authentication failed"
        flash[:notice] = "Invalid login credentials"
        redirect_to user_login and return 
      end 

    end 

   

    def user_registration 
      render "user/user_registration"
    end 

    def user_profile 
      guest_user
      render "user/user_profile"
    end 

    def current_or_guest_user
      if @current_user
        if session[:guest_user_id] && session[:guest_user_id] != current_user.id
          logging_in
          # reload guest_user to prevent caching problems before destruction
          guest_user(with_retry = false).try(:reload).try(:destroy)
          session[:guest_user_id] = nil
        end
        @current_user
      else
        guest_user 
      end
      redirect_to action:"user_profile"

    end

 
    
    def guest_user(with_retry = true)
      if @user
        @userToRender = @user 
      else 
        @userToRender = User.find(session[:guest_user_id] ||= create_guest_user.id)
      end 
    rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
        session[:guest_user_id] = nil
        guest_user if with_retry
    end
    
    def logging_in
       
    end

    def create_guest_user 
       guest_user = FactoryBot.create(:guest_user)
    end 

   
    def initialize(guest = false)
        @current_user = false
    end 

    private 
    def user_params 
      params.require(:user).permit(:username, :password_hash, :password_salt, :email, :fullName, :bio)
    end

end 