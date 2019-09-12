require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest


  test "should get new_quiz" do
    get quiz_new_quiz_url
    assert_response :success
  end

  test "should list all quizzes" do
    get "/quiz/quizzes"
    assert_response :success
  end


end


