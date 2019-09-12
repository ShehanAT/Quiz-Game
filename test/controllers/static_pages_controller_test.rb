require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
    test "should get start" do
        get start_quiz_start_url
        assert_response :success
      end
    
    test "should get welcome" do 
        get start_quiz_welcome_url
        assert_response :success
    end
    
end 