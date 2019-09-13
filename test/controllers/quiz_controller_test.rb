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

  test "should get new_quiz with corresponding collection" do
    get "/quiz/new_quiz_to_collection", params: { collection_id: 2, question: "This is test question 2?", answer: "This is test answer 2" }
    assert_response :success
  end 

  test "should delete quiz by specifying id" do 
    delete "/quiz/delete_quiz_by_id", params: {id: 298486374}
    assert_response :success 
  end 



end


