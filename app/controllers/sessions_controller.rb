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
            cookies[:auth_token] = user.auth_token 
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
        cookies.delete(:auth_token)
        redirect_to root_url
    end 

    def show 
        destroy
    end 

    def forgot_password_new
        respond_to do |format|
            format.html { render "sessions/html/forgot_password" }
            format.js { render "sessions/js/forgot_password" }
            format.json { render json: { status: true, path: "/sessions/forgot_password" } }
        end 
    end 
    
    def forgot_password_create
        if params[:email].blank?
            respond_to do |format|
                format.html { render "sessions/html/forgot_password" }
                format.js { render "sessions/js/forgot_password" }
                format.json { render json: {status: false, message: "Email Field Cannot Be Blank!"}}
            end 
        end 
        @user = User.where(email: params[:email]).take 
        

    end 


      
end
