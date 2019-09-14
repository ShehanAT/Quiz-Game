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
        Capybara.visit("/user/user_registration")
        Capybara.within("form") do
            Capybara.find("input[value=submitButton]").click
            assert_current_path('/user/user_registration')
        end
    end 
  
end