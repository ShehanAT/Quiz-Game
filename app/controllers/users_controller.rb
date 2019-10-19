class UsersController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }
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
        @user = User.find(params[:id])
    end 

    def edit 
        @user = User.find(params[:id])
    end    

    def update 
        response ||= { }
        case params[:commit]
        when "change_username"
            response = User.change_username(params[:username], session[:user_id])
        when "change_email"
            response = User.change_email(params[:email], session[:user_id])
        when "change_password"
            response = User.change_password(params[:current_password], params[:new_password], session[:user_id])
        when "change_fullName"
            response = User.change_fullName(params[:fullName], session[:user_id])
        when "check_email"
            response = User.check_email(params[:email])
        when "check_username"
            response = User.check_username(params[:username])
        else 
        end 
        respond_to do |format|
            format.json { render json: response }
        end 
    end 

    def destroy
        if User.destroy(params[:id])
            session[:user_id] = false 
            session[:username] = false 
            session[:quiz_id] = false 
            respond_to do |format|
                format.json { render json: {status: true, message: "User Deleted!" } }
            end 
        else 
            respond_to do |format| 
                format.html { render "edit" }
                format.json { render json: { status: false, message: "Attempt To Delete User Failed!" } }
            end 
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :fullName, :bio, :p_salt)
    end
end 
