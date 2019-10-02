require "helpers"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe QuestionHelper do

    it "should redirect to /questions after /questions/new submit" do 
        capybara_quiz_view
        Capybara.page.first("input[id='add_questions_link']").click 
        sleep 0.1
        Capybara.fill_in("question", with: "This is a sample question?")
        Capybara.fill_in("answer1", with: "Sample answer 1")
        Capybara.fill_in("answer2", with: "Sample answer 2")
        Capybara.fill_in("answer3", with: "Sample answer 3")
        Capybara.fill_in("answer4", with: "Sample answer 4")
        Capybara.page.first("input[type='checkbox']").set(true)
        Capybara.page.first("button[id='add_question_link']").click 
        sleep 0.1
        expect(Capybara.page.first("h3[id='add_questions_message']").text).to eq("Now Editing Question #2")

    end 



end 