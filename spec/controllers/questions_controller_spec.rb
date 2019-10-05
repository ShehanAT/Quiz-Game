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
    
    it "homepage button should redirect to root_url" do 
        capybara_questions_index
        expect(Capybara.page.first("input[id='homepage_link']").value).to eq("Back To Home")
        old_path = Capybara.page.current_path
        Capybara.page.first("input[id='homepage_link']").click 
        sleep 0.1
        new_path = Capybara.page.current_path
        expect(old_path).not_to eq(new_path)
    end 

    it "index page should show corresponding quiz for each question" do 
        capybara_questions_index
        expect(Capybara.page.first("td[class='quiz_name']").text).not_to eq("")
    end 

    it "click on question on index page should redirect to /questions/:id" do 
        capybara_questions_index
        old_path = Capybara.page.current_path
        Capybara.page.first("td[class='question_name']").click
        sleep 0.1
        new_path = Capybara.page.current_path
        expect(old_path).not_to eq(new_path)
    end 

    it "/questions/:id should display corresponding quiz name" do 
        capybara_questions_index 
        Capybara.page.first("a").click 
        sleep 0.1
        expect(Capybara.page.first("h3[id='question_name']").text).not_to eq("")
    end 


end 