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
        score.score = 10
        assert_not score.save, "Score instance is saving with empty userId"
    end 

    


end 