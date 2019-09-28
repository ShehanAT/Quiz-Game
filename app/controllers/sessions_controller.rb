class SessionsController < ApplicationController
    def new 
        respond_to do |format|
            format.html { render "new" }
            format.js { render "new" }
            format.json { render json: { status: "Invalid Credentials!" } }
        end     
    end 

    def create 
        user = User.authenticate(params[:username], params[:password])
        if user
            session[:user_id] = user.id
            session[:username] = user.username
            redirect_to root_url
        else 
            respond_to do |format|
                format.html { render "new" }
                format.js { render "new"}
            end 
        end 
    end 

    def destroy
        session[:user_id] = false 
        session[:username] = false 
        redirect_to root_url
    end 


      
end
