require "helpers"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe QuestionHelper do

    it "should redirect to /questions after submitting new question" do 
        capybara_new_quiz_question
        Capybara.page.first("button[id='add_question_link']").click 
        sleep 0.1
        expect(Capybara.page.all("div[class='add_question_section']")[1]).to be true 

    end 



end 