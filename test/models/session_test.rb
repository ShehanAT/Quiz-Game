require 'test_helper'

class SessionTest < ActiveSupport::TestCase
    test "the truth" do 
        assert true 
    end 

    test "should create new instance of Session" do 
        assert session = Session.new 
    end 

    test "should not save Session instance when userId/quizId/highScore is empty" do 
        session = Session.new 
        assert_not session.save, "Session instance is saving with empty userId/quizId/highScore fields"
    end 


end 