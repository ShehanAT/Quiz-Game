class UserController < ApplicationController
  protect_from_forgery

  def create 
    begin
      @userToRender = User.new
      password_credentials = User.encrypt_password(params[:password])
      password_salt = password_credentials[0]
      password_hash = password_credentials[1]
      password_confirmation_hash = User.encrypt_password(params[:password_confirmation], password_salt)[1]
      @userToRender = User.create(
        :username => params[:username], 
        :email => params[:email],
        :password_salt => password_salt,
        :password => password_hash,
        :fullName => params[:fullName],
        :bio => params[:bio],
        :password_confirmation => password_confirmation_hash
        )  
      if @userToRender.save! 
        user_profile(@userToRender)
      end
    rescue ActiveRecord::RecordInvalid
      render "new"
    end 
  end 
    
  def new  
    @userToRender = User.new
  end 

  def user_profile(user=nil)
    redirect_to "/welcome" 
  end 



 
end 