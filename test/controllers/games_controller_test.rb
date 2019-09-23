require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
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

  test "/quizGame should render end view after 4 answer button clicks" do 
    Capybara.current_driver = Capybara.javascript_driver
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    for i in 0..3
      Capybara.page.first("input[type='submit']").click
      sleep 0.1
    end 
    assert_equal("Game Over", Capybara.page.first("h1").text)
  end 



end
