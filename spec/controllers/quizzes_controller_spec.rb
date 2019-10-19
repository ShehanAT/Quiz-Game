
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
   
    it "root_url should render " do 
        capybara_login
        expect(Capybara.page.current_path).to eq("/")
    end 

    it "root_url should render 4 links" do 
        capybara_login_admin
        expect(Capybara.page.all("a")[3]).to be_an_instance_of(Capybara::Node::Element) 
    end 

    it "/quizzes should show all quizzes" do 
        capybara_login
        expect(Capybara.page.all("a")[3]).to be_an_instance_of(Capybara::Node::Element)
    end 

    it "/quizzes quiz link should go to /quizzes/:quiz_id" do 
        capybara_login
        Capybara.page.first("a[class='quiz_link']").click
        expect(Capybara.page.current_path).to eq("/quizzes/1")
    end 

    it "/quiz/:id should display quiz info" do 
        capybara_login
        Capybara.page.first("a[class='quiz_link']").click 
        sleep 1.5
        expect(Capybara.page.first("h3").text).to eq("Title: First Sample Quiz")
    end     

    it "/quiz/:id should display 4 answer buttons after input[id='take_quiz_link'] click " do 
        capybara_login
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.first("button[id='answer4']")).to be_an_instance_of(Capybara::Node::Element)
    end 
    

    it "/quiz/:id should hide quiz info on input[id='take_quiz_link'] click" do 
        capybara_login
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.first("h3", :visible => false )).to be_an_instance_of(Capybara::Node::Element)
    end 

    it "/quiz/:id should show next question on a[class='answer_link'] click" do 
        capybara_login
        Capybara.page.first("a[class='quiz_link']").click 
        sleep 0.1
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 0.1
        old_question = Capybara.page.first("h3[id='current_question']").text 
        Capybara.page.find("#answer1").click 
        sleep 3
        new_question = Capybara.page.first("h3[id='current_question']").text 
        expect(old_question).not_to eq(new_question)
    end 

    # it "ajax request to quizzes#save_score should be successful" do 
    #     capybara_login
    #     Capybara.page.first("a[class='quiz_link'").click 
    #     Capybara.page.first("input[id='take_quiz_link']").click 
    #     for i in (0..3)
    #         Capybara.page.find("#answer1").click 
    #         sleep 5
    #     end 
    #     sleep 5
        # expect(Capybara.page.first("h3[id='end_quiz_message']").text).to eq("Quiz Finished!")
        # expect(Capybara.page.first("h4[id='save_score_status']").text).not_to eq("")
        # expect(Capybara.page.first("button[id='replay_quiz_button']").text).not_to eq("")
    # end

    it "/quizzes/new should display new quiz form" do 
        capybara_login 
        sleep 0.5
        Capybara.page.first("a[id='new_quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.current_path).to eq("/quizzes/new")
    end 

    it "new quiz info section => add questions section" do
        capybara_login 
        Capybara.page.first("a[id='new_quiz_link']").click 
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
        capybara_logout
        Capybara.page.first("a[id='register_link']").click
        expect(Capybara.page.current_path).to eq("/users/new")
    end 

    it "add new questions button should redirect to new_question_path" do 
        capybara_new_quiz_images
        sleep 0.5
        Capybara.page.first("input[id='add_questions_link']").click 
        sleep 0.1
        expect(Capybara.page.current_path).to eq("/questions/new")
    end 

    it "/quizzes/:id should redirect on button click" do 
        capybara_login 
        Capybara.page.first("a[class='quiz_link']").click 
        Capybara.page.first("input[id='edit_quiz_link']").click 
        expect(Capybara.page.current_path).to eq("/quizzes/1/edit") 
    end 

    it "/quizzes/:id should redirect to quizzes_path" do 
        capybara_login 
        Capybara.page.first("a[class='quiz_link']").click 
        Capybara.page.first("input[id='back_link']").click 
        expect(Capybara.page.current_path).to eq("/") 
    end 

    it "/quizzes/:id/edit update+delete buttons should redirect to /quizzes" do 
        buttons = ["input[value='Update Quiz']", "input[value='Delete This Quiz']"]
        for i in 0...2 
            capybara_login 
            Capybara.page.first("a[class='quiz_link'").click 
            Capybara.page.first("input[id='edit_quiz_link'").click 
            old_path = Capybara.page.current_path
            Capybara.page.first(buttons[i]).click 
            new_path = Capybara.page.current_path
            expect(old_path).not_to eq(new_path)
        end 

    end 

    it "delete quiz link should redirect to root_url" do 
        capybara_login
        Capybara.page.first("a[class='quiz_link']").click 
        Capybara.page.first("button[id='delete_quiz_link']").click 
        Capybara.page.first("button[id='quizDeleteYes']").click 
        sleep 0.5
        Capybara.page.driver.browser.switch_to.alert.accept
        sleep 0.5
        expect(Capybara.page.current_path).to eq("/")
    end 

    it "new_questions_path should refresh after submit" do 
        capybara_new_quiz_question_image
        Capybara.page.first("input[value='Submit And Add Another Question']").click 
        sleep 1.5
        expect(Capybara.page.current_path).to eq("/questions/new")
    end 

    it "new_questions_path should redirect to question_path(question.id) after save and exit btn" do 
        capybara_new_quiz_question_image 
        Capybara.page.first("input[value='Submit And Exit']").click 
        sleep 2
        expect(Capybara.page.current_path).to eq("/quizzes/5")
    end 

    it "quiz with images should render image on /quizzes/:id" do 
        capybara_new_quiz_question_image 
        Capybara.page.first("input[value='Submit And Exit']").click 
        sleep 1.5 
        Capybara.page.first("input[id='take_quiz_link']").click 
        sleep 1.5 
        expect(Capybara.page.first("img"))

    end     



end 
