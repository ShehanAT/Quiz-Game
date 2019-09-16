require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'

class UserControllerTest < ActionDispatch::IntegrationTest
    include Capybara::DSL
    include Capybara::Minitest::Assertions

    test "the truth" do 
        assert true
    end 


    test "should submit registration form, return 200 status code" do 
        Capybara.visit("/user/user_registration")
        Capybara.within("form") do
            Capybara.fill_in "username", :with => "testing1"
            Capybara.fill_in "email", :with => "testing1@testing1.com"
            Capybara.fill_in "password", :with => "testing1"
            Capybara.fill_in "password_confirmation", :with => "testing1"
            Capybara.fill_in "fullName", :with => "Testing1 Testing1"
            Capybara.fill_in "bio", :with => "Testing1"
            Capybara.find("input[value='Register']").click
            assert_equal(200, Capybara.page.status_code)
        end 
    end 

  


  
    
  
end