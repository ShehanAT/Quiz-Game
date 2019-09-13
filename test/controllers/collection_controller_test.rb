require 'test_helper'

class CollectionControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "should make new collection and show it" do 
    get "/collection/new_collection", params: { name: "Test Sample Collection", category: "Testing", total_quizzes: 3}
    assert_response :success
  end 

  test "should show collection by id " do 
    get "/collection/show_collection_by_id", params: { id: 2}
    assert_response :success 
  end 

  test "should delete collection by id" do
    delete "/collection/delete_collection_by_id", params: { id: 2}
    assert_response :success
  end

  test "show update collection by id" do 
    put "/collection/update_collection_by_id", params: { id: 2, update: 'name', newValue: "name2"}
    assert_response :success
  end 
end
