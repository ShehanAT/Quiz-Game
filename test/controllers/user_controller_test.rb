require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'

class UserControllerTest < ActionDispatch::IntegrationTest
    include Capybara::DSL
    include Capybara::Minitest::Assertions

    test "the truth" do 
        assert true
    end 


    test "should not submit registration form when any field is empty" do 
        Capybara.visit("/user/user_registration")
        Capybara.within("form") do
            Capybara.find("input[value='Save changes']").click
            assert_current_path('/user/user_registration', :ignore_query => true)
        end
    end 

    test "should submit login form and return 200 status code" do 
        Capybara.visit("/user/user_login")
        Capybara.fill_in 'username', :with => 'admin'
        Capybara.fill_in 'password', :with => 'admin'
        Capybara.within("form") do
            Capybara.find("input[value='Save changes']").click
            assert_equal(200, Capybara.page.status_code)
        end
    end

    test "should set session id for guest user" do 
        get "/user/current_or_guest_user" 
        assert session[:guest_user_id]
    end 

    
  
end