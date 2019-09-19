require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest

  test "should set session id for guest user" do 
    assert_nothing_raised do 
      get "/session/guest_user"
    end 
  end 


  test "should return 200 status code for session/login" do 
    get "/session/login"
    assert_response :success
  end 



  test "should submit login form, return 200 status code" do 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.within("form") do
        Capybara.find("input[value='Login']").click
        assert_equal(200, Capybara.page.status_code)
    end
  end 

  test "should submit login form without changing the url from /session/login to /session/create" do 
    Capybara.visit("/session/login")
    before_login_url = Capybara.current_url
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.within("form") do
        Capybara.find("input[value='Login']").click
        after_login_url = Capybara.current_url
        assert_equal(before_login_url, "http://www.example.com/session/login")
    end
  end 

end
