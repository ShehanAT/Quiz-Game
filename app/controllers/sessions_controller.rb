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
            redirect_to root_url
        else 
            respond_to do |format|
                format.html { render "new" }
                format.js { render "new"}
            end 
        end 
    end 
      
end
