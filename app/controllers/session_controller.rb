class SessionController < ApplicationController
 
    def new
      @userToRender = User.new
      flash[:alert] = ""
      respond_to do |format|
        format.html { render "new" }
        format.js { render "new" }
      end 
    end 

    def guest_user
      @userToRender = User.find_by_username("guestUsername")
      if @userToRender
        Rails.logger.info "Guest User Found"
      else 
        Rails.logger.info "Guest User Not Found"
      end 
      session[:guest_user_id] = @userToRender.id
      redirect_to "/welcome" 
    end 

    def create_guest_user 
      @userToRender = FactoryBot.create(:guest_user)
    end 

    def create 
      
      @userToRender = User.authenticate(params[:username], params[:password])
      respond_to do |format|
       
        if @userToRender
          flash[:alert] = "" 
          session[:username] = @userToRender.username
          session[:user_id] = @userToRender.id
          session[:guest_user_id] = false
          session = Session.find_by_userId(@userToRender.id)
          if !session
            session = Session.create(:userId => @userToRender.id)
            session.save!
          end
          format.html { redirect_to "/welcome" }
        else 
          flash[:alert] = "Invalid login credentials"
          format.js { render "new" }
          format.html { render "new" }
        end 
     
      end  
    end 

    def user_profile(user=nil)
     
    end 
      
 
end
