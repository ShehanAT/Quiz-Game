require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "quiz object should be truthy" do 
    quiz = Quiz.new 
    assert quiz, "quiz object is not truthy"
  end 

  test "quiz object should not save without question and/or answer" do 
    quiz = Quiz.new 
    assert_not quiz.save, "quiz object is saving without question and/or answer"
  end 

  test "quiz object should not save if answerId attribute is not numerical" do 
    quiz = Quiz.new 
    quiz.collection_id = 1
    quiz.answerId ="ThisIsAString"
    assert_not quiz.save, "quiz object is saving with non-numerical answerId"
  end 

  
end
