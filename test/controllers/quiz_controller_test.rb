require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "should make new quiz and show it" do 
    get "/quiz/new_quiz", params: { name: "Test Sample quiz", category: "Testing", total_quizzes: 3}
    assert_response :success
  end 

  test "should show quiz by id " do 
    get "/quiz/show_quiz_by_id", params: { id: 2}
    assert_response :success 
  end 

  test "should delete quiz by id" do
    delete "/quiz/delete_quiz_by_id", params: { id: 2}
    assert_response :success
  end

  test "show update quiz by id" do 
    put "/quiz/update_quiz_by_id", params: { id: 2, update: 'name', newValue: "name2"}
    assert_response :success
  end 
end
