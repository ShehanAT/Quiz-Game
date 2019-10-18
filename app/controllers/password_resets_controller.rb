class PasswordResetsController < ApplicationController
  def new
  end 

  def create 
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset  
    else
      return redirect_to new_password_reset_path, :notice => "Email Not Found! Please Enter A Valid Email"
    end 
    return redirect_to root_url, :notice => "Email Sent With Password Reset Instructions"
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
    respond_to do |format|
      format.html { render "edit" }
      format.js { render "edit" }
    end 
  end 

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago 
      redirect_to root_url, :notice => "Password Reset Has Been Expired"
      respond_to do |format|
        format.js { render "edit" }
        format.json { render json: {status: false, message: "Password Reset Token Has Been Expired. Please Restart The Reset Process." } }
      end 
    elsif @user.update(:password => params[:password])
      session[:user_id] = false 
      session[:username] = false 
      cookies.delete(:auth_token)
      respond_to do |format|
        format.js { render "edit", flash[:notice] => "Password Has Been Reset!" }
        format.json { render json: {status: true, message: "Password Has Been Reset!" } }
      end
    else 
      respond_to do |format|
        format.js { render "edit" }
        format.json { render json: {status: false, message: "Password Failed To Update!" } }
      end
    end 
  end 
end
