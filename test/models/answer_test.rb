require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save question instance with empty quizId/question/answerId" do
    answer = Answer.new 
    assert_not answer.save, "question is saving with empty quizId/question/answerId"
  end   

 
  
  
end
