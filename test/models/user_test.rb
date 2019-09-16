require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save User instance when any field is empty, using password empty as example" do 
    user = User.new 
    user.username = "testing1"
    user.email = "testing@testing.com"
    user.password = ""
    user.fullName = "Testing Testing"
    user.bio = "testingtestingtesting"
    user.save
    assert_equal(["Password can't be blank"], user.errors.full_messages)
  end 

  test "should not save User instance when passwords do not match" do 
    user = User.new 
    user.username = "testing1"
    user.email = "testing@testing.com"
    user.password = "testing1"
    user.password_confirmation = "testing2"
    user.fullName = "Testing Testing"
    user.bio = "testingtestingtesting"
    user.save
    assert_equal(["Password confirmation doesn't match Password"], user.errors.full_messages)
  end 

  test "should not save User instance when email is invalid" do 
    user = User.new 
    user.username = "testing1"
    user.email = "testingInvalidEmail"
    user.password = "testing1"
    user.password_confirmation = "testing1"
    user.fullName = "Testing Testing"
    user.bio = "testingtestingtesting"
    user.save
    assert_equal(["Email is invalid"], user.errors.full_messages)
  end 



end
