require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
    test "the truth" do 
        assert true 
    end 

    test "should create new instance of Score" do 
        assert score = Score.new 
    end 

    test "should not save Score instance when userId is empty" do 
        score = Score.new
        score.quiz_id = 1
        score.highScore = 10
        assert_not score.save, "Score instance is saving with empty userId"
    end 

    test "should not save Score instance when record with same userId already exists in db" do 
        old_score = Score.new 
        old_score.user_id = 1
        old_score.save!
        new_score = Score.new 
        new_score.user_id = 1 
        assert_not new_score.save, "Score instance with duplicate userId is saving"
    end 


end 