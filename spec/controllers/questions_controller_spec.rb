require "helpers"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe QuestionHelper do

    it "should change /questions/new form title on button click" do 
        capybara_new_quiz_fill_in
        Capybara.page.first("button[id='add_question_link']").click 
        sleep 0.1
        expect(Capybara.page.first("h3[id='add_questions_message']").text).to eq("Now Editing Question #2")
    end 

    it "should redirect to /questions after /question/new submit" do 
        capybara_new_quiz_fill_in
        old_path = Capybara.page.current_path
        Capybara.page.first("button[id='submit_link']").click 
        new_path = Capybara.page.current_path 
        expect(new_path).not_to eq(old_path)
    end       



end 