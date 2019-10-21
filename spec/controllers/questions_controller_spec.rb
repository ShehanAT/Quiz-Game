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
    
    it "delete question link should redirect to questions_path" do 
        capybara_login
        Capybara.page.first("a[id='questions_link']").click 
        Capybara.page.first("a[class='question_name']").click 
        Capybara.page.first("button[id='delete_question_link']").click
        Capybara.page.first("button[id='questionDeleteYes']").click 
        sleep 0.5
        expect(Capybara.page.current_path).to eq("/questions")
    end 
    
    it "back button should redirect to root_url" do 
        capybara_questions_index
        Capybara.page.first("input[id='homepage_link']").click 
        sleep 0.1
        expect(Capybara.page.current_path).to eq("/")
    end 

    it "index page should show corresponding question for each quiz" do 
        capybara_questions_index
        expect(Capybara.page.first("td[class='quiz_name']").text).not_to eq("")
    end 

    it "click on question on index page should redirect to /questions/:id" do 
        capybara_questions_index
        Capybara.find(:css, "a[class='question_name']", match: :first).click
        sleep 0.1
        expect(Capybara.page.current_path).not_to eq("/questions")
    end 

    it "/questions/:id back link to questions_path should work" do 
        capybara_questions_index
        sleep 0.5
        Capybara.page.first("a[class='question_name']").click 
        sleep 0.5
        Capybara.page.first("input[value='Back']").click
        sleep 0.5
        expect(Capybara.page.current_path).to eq("/questions")
    end

    it "/questions/:id links to edit page should work" do 
        capybara_questions_index
        Capybara.page.first("a[class='question_name']").click 
        sleep 1.5
        Capybara.page.first("input[id='edit_question_link']").click
        expect(Capybara.page.current_path).not_to eq("/questions/1")
        sleep 1.5
    end

    it "/questions/:id/edit should render form" do 
        capybara_questions_index 
        sleep 0.5
        Capybara.page.first("a[class='question_name']").click 
        sleep 1
        Capybara.page.first("input[id='edit_question_link']").click 
        sleep 0.1 
        expect(Capybara.page.first("h3[id='edit_question_title']")).not_to eq("")
        expect(Capybara.page.first("input[id='question']").value).not_to eq("")
        expect(Capybara.page.first("input[id='answer1']").value).not_to eq("")
        expect(Capybara.page.first("input[id='answer2']").value).not_to eq("")
        expect(Capybara.page.first("input[id='answer3']").value).not_to eq("")
        expect(Capybara.page.first("input[id='answer4']").value).not_to eq("")
        Capybara.page.first("a[id='back_link']").click
        expect(Capybara.page.current_path).not_to eq("/questions/1/edit")
    end 

    it "/questions/:id/edit form submit should redirect to question_path(:id)" do
        capybara_questions_index
        Capybara.page.first("a[class='question_name']").click 
        sleep 1.5
        Capybara.page.first("input[id='edit_question_link']").click 
        Capybara.page.first("input[id='update_question_link']").click 
        sleep 1.5
        expect(Capybara.page.current_path).to eq("/questions/1")
    end 

    it "/questions/:id/edit should include file upload for image question" do 
        capybara_questions_index
        Capybara.page.first("a[class='question_name']").click 
        sleep 1.5 
        Capybara.page.first("input[id='edit_question_link']").click 
        expect(Capybara.page.first("input[type='file']")).to be_an_instance_of(Capybara::Node::Element) 
    end     

 


end 
