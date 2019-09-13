require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest


  test "should get new_quiz" do
    get "/quiz/new_quiz", params: { collection_id: 1}
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

  test "should update quiz by specifying id" do 
    put "/quiz/update_quiz_by_id", params: { id: 298486374, update: "question", newField: "whatNewQuestion2?" }
    assert_response :success 
  end 

  test "should return 200 for error page" do 
    get "/quiz/error"
    assert_response :success
  end 

end


