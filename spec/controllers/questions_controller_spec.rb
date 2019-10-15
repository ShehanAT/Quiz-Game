require "spec_helper"
require "helpers/sessions_helper_spec"
require "helpers/users_helper_spec"
require "helpers/quizzes_helper_spec"
require "helpers/questions_helper_spec"

RSpec.configure do |c|
    c.include SessionsHelper
    c.include UsersHelper
    c.include QuizzesHelper 
    c.include QuestionsHelper
end

RSpec.describe QuestionsHelper do

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
        Capybara.find(:css, "a[class='question_name']", match: :first).click
        sleep 0.1
        expect(Capybara.page.current_path).not_to eq("/questions")
    end 

    it "/questions/:id should display corresponding info" do 
        capybara_questions_index 
        Capybara.page.first("a[class='question_name']").click 
        sleep 0.1
        expect(Capybara.page.first("h3[id='question_name']").text).not_to eq("")
        expect(Capybara.page.first("h3[id='quiz_name']").text).not_to eq("")
    end 

    it "/questions/:id links to homepage+index+edit page should work" do 
        buttons = ["input[id='homepage_link']", "input[id='questions_link']", "input[id='edit_question_link']"]
        for a in 0...3
            capybara_questions_index
            Capybara.page.first("a[class='question_name']").click 
            sleep 0.1
            old_path = Capybara.page.current_path
            Capybara.page.first("#{buttons[a]}").click
            sleep 0.1 
            new_path = Capybara.page.current_path
            expect(old_path).not_to eq(new_path)
        end 
    end

    it "/questions/:id/edit should render form" do 
        capybara_questions_index 
        Capybara.page.first("a[class='question_name']").click 
        sleep 0.1 
        Capybara.page.first("input[id='edit_question_link']").click 
        sleep 0.1 
        expect(Capybara.page.first("h3[id='edit_question_title']")).not_to eq("")
        expect(Capybara.page.first("input[id='question']").value).not_to eq("")
        expect(Capybara.page.first("input[id='answer1']").value).not_to eq("")
        expect(Capybara.page.first("input[id='answer2']").value).not_to eq("")
        expect(Capybara.page.first("input[id='answer3']").value).not_to eq("")
        expect(Capybara.page.first("input[id='answer4']").value).not_to eq("")
        Capybara.page.first("input[id='back_link']").click
        expect(Capybara.page.current_path).not_to eq("/questions/1/edit")
    end 

    it "/questions/:id/edit form submit should redirect to /questions" do
        buttons = ["input[type='submit']"] 
        for i in 0..2 
            capybara_questions_index
            Capybara.page.first("a[class='question_name']").click 
            Capybara.page.first("input[id='edit_question_link']").click 
            Capybara.page.first("button[id='update_question_link']").click 
            expect(Capybara.page.current_path).to eq("/questions")
        end 
    end 

    it "/questions/new should delete question on btn click" do 
        capybara_new_quiz_fill_in
        Capybara.page.first("button[id='add_question_link']").click 
        Capybara.page.first("button.delete_question_link").click 
        expect(Capybara.page.all("h1.question_text")[1]).not_to be_an_instance_of(Capybara::Node::Element)
    end 


end 
