class SessionController < ApplicationController

    def guest_user
        @guest_user = FactoryBot.create(:guest_user)
        session[:guest_user_id] = @guest_user.id
        render "start_quiz/welcome"
    end 
      
 
end
