require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "quiz object should be truthy" do
    quiz = Quiz.new 
    assert quiz, "quiz object is not truthy"
  end 
  test "quiz object should not save without name/category" do 
    quiz = Quiz.new 
    assert_not quiz.save, "quiz is saving without name/category"
  end 
end
