require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "question object should be truthy" do 
    question = Question.new 
    assert question, "question object is not truthy"
  end 

  test "question object should not save without question and/or answer" do 
    question = Question.new 
    assert_not question.save, "question object is saving without question and/or answer"
  end 

  test "question object should not save if answerId attribute is not numerical" do 
    question = Question.new 
    question.quiz_id = 1
    question.answerId ="ThisIsAString"
    assert_not question.save, "question object is saving with non-numerical answerId"
  end 

  
end
