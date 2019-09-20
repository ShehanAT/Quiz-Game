require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save question instance with empty quizId/question/answerId" do
    question = Answer.new 
    assert_not question.save, "question is saving with empty quizId/question/answerId"
  end   

  test "should not save string for answerId attribute of question instance" do 
    question = Answer.new 
    question.answerId = "ThisIsAString"
    question.answer = "ThisIsASampleQuestion?"
    assert_not question.save, "question is saving with invalid datatype for answerId"
  end 
  
end
