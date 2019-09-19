require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
    
    test "should get welcome view" do 
        get "/welcome"
        assert_response :success
    end

    test "should get start view" do 
        get "/"
        assert_response :success
    end
    
end 