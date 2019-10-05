require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it "should save new quiz" do 
    new_quiz_params = {
        :name => "New Quiz Name",
        :category => "New Quiz Category"
      }
    new_quiz = Quiz.create(new_quiz_params)
    expect(new_quiz.save).to be true
  end 
end
