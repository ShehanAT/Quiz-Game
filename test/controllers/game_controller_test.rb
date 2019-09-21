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

end
