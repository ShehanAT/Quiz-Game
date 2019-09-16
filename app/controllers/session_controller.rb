class SessionController < ApplicationController

    def guest_user
        @guest_user = User.create(params[:guest_user])
        session[:guest_user_id] = @guest_user.id
        redirect_to "start_quiz/welcome"
    end 
      
 
end
