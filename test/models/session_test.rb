require 'test_helper'

class SessionTest < ActiveSupport::TestCase
    test "the truth" do 
        assert true 
    end 

    test "should create new instance of Session" do 
        assert session = Session.new 
    end 

    test "should not save Session instance when userId is empty" do 
        session = Session.new
        session.quiz_id = 1
        session.highScore = 10
        assert_not session.save, "Session instance is saving with empty userId"
    end 

    test "should not save Session instance when record with same userId already exists in db" do 
        old_session = Session.new 
        old_session.user_id = 1
        old_session.save!
        new_session = Session.new 
        new_session.user_id = 1 
        assert_not new_session.save, "Session instance with duplicate userId is saving"
    end 


end 