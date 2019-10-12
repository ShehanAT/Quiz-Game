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
        @user = User.find(params[:id])
    end 

    def edit 
        @user = User.find(params[:id])
    end 

    def username_validations
        respond_to do |format|
            format.json { render json:{ response: User.check_username(params[:username]) } }
        end 
    end 

    def email_validations
        respond_to do |format|
            format.json { render json:{ response: User.check_email(params[:email]) } }
        end 
    end 
    
    def change_username
        respond_to do |format|
            format.json { render json: { response: User.change_username(params[:username], session[:user_id])}}
        end 
    end 

    def change_email
        respond_to do |format|
            format.json { render json: { response: User.change_email(params[:email], session[:user_id])}}
        end 
    end 

    def change_fullName
        respond_to do |format|
            format.json { render json: { response: User.change_fullName(params[:fullName], session[:user_id])}}
        end 
    end 

    def change_password
        respond_to do |format|
            format.json { render json: { response: User.change_password(params[:current_password], params[:new_password], session[:user_id]) } }
        end 
    end     

    def update 
        redirect_to root_url
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
