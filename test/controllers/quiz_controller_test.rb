require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get quizzes" do
    get quiz_quizzes_url
    assert_response :success
  end

  test "should get new_quiz" do
    get quiz_new_quiz_url
    assert_response :success
  end

  test "should get quiz" do
    get quiz_quiz_url
    assert_response :success
  end

end
