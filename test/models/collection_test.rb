require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "collection object should be truthy" do 
    collection = Collection.new 
    assert collection, "collection object is not truthy"
  end
  
  
end
