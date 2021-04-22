require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "question should be truthy" do 
    question = Question.new 
    assert question, "question object is not truthy"
  end 

  test "question should not save without question and/or answer" do 
    question = Question.new 
    assert_not question.save, "question object is saving without question and/or answer"
  end 

  test "question should not save if quiz_id is not numerical" do 
    question = Question.new 
    question.quiz_id = ""
    assert_not question.save, "question object is saving with non-numerical quiz_id"
  end 

  
end
