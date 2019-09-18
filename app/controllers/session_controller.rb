class SessionController < ApplicationController

    def new
    end 

    def guest_user
      @userToRender = User.find_by_username("guestUsername")
      if @userToRender
        Rails.logger.info "Guest User Found"
      else 
        Rails.logger.info "Guest User Not Found"
      end 
      session[:guest_user_id] = @userToRender.id
      user_profile(@userToRender)
    end 

    def create_guest_user 
      @userToRender = FactoryBot.create(:guest_user)
    end 

    def create 
        @userToRender = User.authenticate(params[:username], params[:password])
        if @userToRender 
          session[:username] = @userToRender.username
          session[:user_id] = @userToRender.id
          session[:guest_user_id] = false
          user_profile
        else 
          flash[:notice] = "Invalid login credentials"
          render "new"
        end 
    end 

    def user_profile(user=nil)
      render "user/user_profile"
    end 
      
 
end
