require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz = quizzes(:one)
  end

  test "should list all quizzes" do
    get quiz_quizzes_url
    assert_response :success
  end

  test "should get new" do
    get quiz_new_quiz_url
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Sample.count') do
      post quiz_create_quizzes_url, params: { quiz: { 
        question: "Question for quizzes_controller_test:18 ?",
        answer: "Answer for quizzes_controller_test:18 ?"
       } }
    end
    assert_response :redirect
  end

  test "should populate Quiz with 5 sample quizzes" do
    get "/quiz/sample_populate_url" 
    assert_response :redirect
  end

end
