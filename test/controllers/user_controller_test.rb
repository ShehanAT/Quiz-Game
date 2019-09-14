require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'

class UserControllerTest < ActionDispatch::IntegrationTest
    include Capybara::DSL
    include Capybara::Minitest::Assertions

    test "the truth" do 
        assert true
    end 


    test "should not submit form when any field is empty" do 
        Capybara.visit("/user/registration")
        Capybara.within("form") do
            Capybara.find("input[value=submitButton]").click
            assert_current_path('/user/registration')
        end
    end 

    test "should set session id for guest user" do 
        get "/user/current_or_guest_user" 
        assert session[:guest_user_id]
    end 

    
  
end