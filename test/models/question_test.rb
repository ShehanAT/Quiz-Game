require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save question instance with empty quizId/question/answerId" do
    question = Question.new 
    assert_not question.save, "question is saving with empty quizId/question/answerId"
  end   

  test "should not save string for answerId attribute of question instance" do 
    question = Question.new 
    question.answerId = "ThisIsAString"
    question.question = "ThisIsASampleQuestion?"
    assert_not question.save, "question is saving with invalid datatype for answerId"
  end 
  
end
