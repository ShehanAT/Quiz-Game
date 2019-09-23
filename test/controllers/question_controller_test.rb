require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest


  test "should make new question" do
    get "/question/new_question", params: {  quiz_id: 1, answerId: 2}
    assert_response :success
  end

  test "should list all questions" do
    get "/question/questions"
    assert_response :success
  end
  
  test "should show quiz by id " do
    get "/question/show_question", params: { id: 1}
    assert_response :success
  end 

  test "should make new question with corresponding quiz" do
    get "/question/new_question_to_quiz", params: {  quiz_id: 2, answerId: 2 }
    assert_response :success
  end 

  test "should delete question by specifying id" do 
    delete "/question/delete_question_by_id", params: {id: 1}
    assert_response :success 
  end 

  test "should update question by specifying id" do 
    put "/question/update_question_by_id", params: { id: 1, update: "answerId", newField: "whatNewQuestion2" }
    assert_response :success 
  end 

  test "should return 200 for error page" do 
    get "/question/error"
    assert_response :success
  end 

end


