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
            format.json { render json:{ response: Validation.check_username(params[:username]) } }
        end 
    end 

    def email_validations
        respond_to do |format|
            format.json { render json:{ response: Validation.check_email(params[:email]) } }
        end 
    end 

    def update_password
        respond_to do |format|
            format.json { render json: { status: Validation.update_password(params) } }
        end 
    end
    
    def change_username
        respond_to do |format|
            format.json { render json: { response: Content.change_username(params[:username])}}
        end 
    end 

    def change_email
        respond_to do |format|
            format.json { render json: { response: Content.change_email(params[:email])}}
        end 
    end 

    def change_fullName
        respond_to do |format|
            format.json { render json: { response: Content.change_fullName(params[:fullName])}}
        end 
    end 

    def change_password
        respond_to do |format|
            format.json { render json: { response: User.change_password(params[:current_password], params[:new_password]) } }
        end 
    end     

    def update 
        redirect_to root_url
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :fullName, :bio, :p_salt)
    end
end 
