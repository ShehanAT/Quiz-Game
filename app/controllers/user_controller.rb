class UserController < ApplicationController
    protect_from_forgery

    def registration 
      render "user/user_registration"
    end 

    def current_or_guest_user
      if @current_user
        if session[:guest_user_id] && session[:guest_user_id] != current_user.id
          logging_in
          # reload guest_user to prevent caching problems before destruction
          guest_user(with_retry = false).try(:reload).try(:destroy)
          session[:guest_user_id] = nil
        end
        @current_user
      else
        guest_user 
      end
      render "user/user_profile"

    end
    
    def guest_user(with_retry = true)
        @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    
    rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
        session[:guest_user_id] = nil
        guest_user if with_retry
    end
    
    def logging_in
       
    end

    def create_guest_user 
       guest_user = FactoryBot.create(:guest_user)

    end 

   
    def initialize(guest = false)
        @current_user = false
    end 

end 