class UsersController < ApplicationController
  
    def new 
        @user = User.new 
        respond_to do |format|
            format.html { render "new" }
            format.js { render "new" }
            format.json { render :json => @user }
        end 
    end 


    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            session[:username] = @user.username
            redirect_to root_url 
        else 
            respond_to do |format|
                format.html { render "new" }
                format.js { render "new" }
            end 
        end 
    end

    def show 
        @users = User.all
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :fullName, :bio, :p_salt)
    end
end 
