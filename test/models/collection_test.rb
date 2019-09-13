require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "collection object should be truthy" do
    collection = Collection.new 
    assert collection, "collection object is not truthy"
  end 
  test "collection object should not save without name/category/total_quizzes" do 
    collection = Collection.new 
    assert_not collection.save, "collection is saving without name/category/total_quizzes"
  end 
end
