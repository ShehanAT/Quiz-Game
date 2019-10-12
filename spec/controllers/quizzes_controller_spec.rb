
require "helpers/sessions_helper_spec"
require "helpers/users_helper_spec"
require "helpers/quizzes_helper_spec"
require "helpers/questions_helper_spec"

RSpec.configure do |c|
    c.include QuestionsHelper 
    c.include QuizzesHelper 
    c.include UsersHelper 
    c.include SessionsHelper 
end

RSpec.describe QuizzesHelper do
   
    it "root_url should contain link for /quizzes" do 
        capybara_quizzes_index
        expect(Capybara.page.current_path).to eq("/quizzes")
    end 

    it "root_url should render 4 links" do 
        capybara_login_admin
        expect(Capybara.page.all("a")[3]).to be_an_instance_of(Capybara::Node::Element) 
    end 

    it "/quizzes should show all quizzes" do 
        capybara_quizzes_index
        expect(Capybara.page.all("a")[3]).to be_an_instance_of(Capybara::Node::Element)
    end 

    it "/quizzes quiz link should redirect to /quizzes/:quiz_id" do 
        buttons = ["a[class='quiz_link']", "input[id='back_link']"]
        for i in 0...2 
            capybara_quizzes_index
            Capybara.page.first(buttons[i]).click
            if i === 0
                expect(Capybara.page.current_path).to eq("/quizzes/1")
            elsif i === 1
                expect(Capybara.page.current_path).to eq("/")
            end 
        end 
 
    end 

    it "/quiz/:id should display quiz info" do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.first("h3").text).to eq("Title:")
    end     

    it "/quiz/:id should display 4 answer buttons after input[id='take_quiz_link'] click " do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.first("button[id='answer4']")).to be_an_instance_of(Capybara::Node::Element)
    end 
    

    it "/quiz/:id should hide quiz info on input[id='take_quiz_link'] click" do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.first("h3", :visible => false )).to be_an_instance_of(Capybara::Node::Element)
    end 

    it "/quiz/:id should show next question on a[class='answer_link'] click" do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 0.1
        old_question = Capybara.page.first("h3[id='current_question']").text 
        Capybara.page.first("button[class='answer_link'").click 
        new_question = Capybara.page.first("h3[id='current_question']").text 
        expect(old_question).not_to eq(new_question)
    end 

    it "/quiz/:id should show end scene after finishing all questions " do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 0.1
        for i in (0..3)
            Capybara.page.first("button[class='answer_link']").click 
        end 
        expect(Capybara.page.first("h3[id='end_quiz_message']", :visible => true).text).to eq("Quiz Finished!")
    end 

    it "ajax request to quizzes#save_score should be successful" do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 0.1
        for i in (0..3)
            Capybara.page.first("button[class='answer_link']").click 
        end 
        sleep 0.1
        expect(Capybara.page.first("h4[id='save_score_status']").text).not_to eq("")
        expect(Capybara.page.first("button[id='replay_quiz_button']").text).not_to eq("")
    end

    it "/quizzes/new should display new quiz form" do 
        capybara_quizzes_index 
        old_path = Capybara.page.current_path
        Capybara.page.first("input[id='new_quiz_link']").click 
        sleep 0.1
        new_path = Capybara.page.current_path
        expect(new_path).not_to eq(old_path)
    end 

    it "new quiz info section => add questions section" do
        capybara_quizzes_index 
        Capybara.page.first("input[id='new_quiz_link']").click 
        sleep 0.1
        old_path = Capybara.page.current_path 
        Capybara.fill_in("quiz_name", with: "testing1")
        Capybara.fill_in("quiz_category", with: "testing1")
        Capybara.fill_in("quiz_description", with: "testing1")
        Capybara.page.first("input[id='submit_new_quiz_link']").click
        new_path = Capybara.page.current_path
        expect(old_path).not_to eq(new_path)
    end

    it "from: /, 'Register' link should take to: /new " do 
        Capybara.visit("/")
        old_path = Capybara.page.current_path
        Capybara.page.all("a")[0].click
        new_path = Capybara.page.current_path
        expect(new_path).not_to eq(old_path)
    end 

    it "add new questions button should redirect to new_question_path" do 
        capybara_new_quiz
        old_path = Capybara.page.current_path
        Capybara.page.first("input[id='add_questions_link']").click 
        sleep 0.1
        new_path = Capybara.page.current_path
        expect(new_path).not_to eq(old_path)
    end 

    it "/quizzes/:id should redirect on button click" do 
        buttons = ["input[id='edit_quiz_link']", "input[id='back_link']"]
        for i in 0...2 
            capybara_quizzes_index 
            Capybara.page.first("a[class='quiz_link']").click 
            Capybara.page.first(buttons[i]).click 
            if i === 0
                expect(Capybara.page.current_path).to eq("/quizzes/1/edit") 
            elsif i === 1
                expect(Capybara.page.current_path).to eq("/quizzes") 
            end   
        end 
    end 

    it "/quizzes/:id/edit update+delete buttons should redirect to /quizzes" do 
        buttons = ["input[value='Update Quiz']", "input[value='Delete This Quiz']"]
        for i in 0...2 
            capybara_quizzes_index 
            Capybara.page.first("a[class='quiz_link'").click 
            Capybara.page.first("input[id='edit_quiz_link'").click 
            old_path = Capybara.page.current_path
            Capybara.page.first(buttons[i]).click 
            new_path = Capybara.page.current_path
            expect(old_path).not_to eq(new_path)
        end 

    end 


end 
