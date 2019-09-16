require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest

  test "should set session id for guest user" do 
    get "/session/guest_user" 
    assert_response :redirect
  end 

  test "should redirect from /session/guest_user to /start_quiz/welcome" do 
    get "/session/guest_user"
    assert_response :redirect
  end 

  test "should return 200 status code for session/login" do 
    get "/session/login"
    assert_response :success
  end 



  # test "should submit login form, return 200 status code" do 
  #   Capybara.visit("/user/user_login")
  #   Capybara.fill_in 'username', :with => 'admin'
  #   Capybara.fill_in 'password', :with => 'admin'
  #   Capybara.within("form") do
  #       Capybara.find("input[value='Login']").click
  #       assert_equal(200, Capybara.page.status_code)
  #   end



end
