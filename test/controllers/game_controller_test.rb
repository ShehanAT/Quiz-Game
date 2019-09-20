require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "should render the first quiz view on start_quiz/welcome button click" do 
    Capybara.visit("/welcome")
    before_url = Capybara.current_url
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("button[type='submit']").click
    after_url = Capybara.current_url
    assert_not_equal(before_url, after_url)
  end 

  test "should render clickable four piece board on stage view " do 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    Capybara.find("button[id='choice1']").click
    assert true
  end 

  test "four clickable pieces should contain Question.question value for text field" do 
    
  end 
end
