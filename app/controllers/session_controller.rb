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
      render "start_quiz/welcome" 
    end 

    def create_guest_user 
      @userToRender = FactoryBot.create(:guest_user)
    end 

    def create 
      respond_to do |format|
        @userToRender = User.authenticate(params[:username], params[:password])
        
        if @userToRender 
          session[:username] = @userToRender.username
          session[:user_id] = @userToRender.id
          session[:guest_user_id] = false
          format.js { render "start_quiz/welcome" } 
          format.html { render "start_quiz/welcome" }
        else 
          flash[:notice] = "Invalid login credentials"
          format.html { render "new" }
          format.js { render "new" }
        end 
      end
    end 

    def user_profile(user=nil)
     
    end 
      
 
end
