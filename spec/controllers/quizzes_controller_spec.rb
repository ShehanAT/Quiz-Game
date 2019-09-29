
require "helpers"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe QuizzesHelper do
   
    it "root_url should contain link for /quizzes" do 
        capybara_quizzes_index
        expect(Capybara.page.current_path).to eq("/quizzes")
    end 

    it "/quizzes should show all quizzes" do 
        capybara_quizzes_index
        expect(Capybara.page.all("a")[3]).to be_an_instance_of(Capybara::Node::Element)
    end 

    it "/quizzes quiz link should redirect to /quizzes/:quiz_id" do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link']").click
        sleep 0.1
        expect(Capybara.page.current_path).to eq("/quizzes/1")
    end 

    it "/quiz/:id should display quiz info" do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.first("h3").text).to eq("Title:")
    end     

    it "/quiz/:id should display 4 answer buttons after a[id='take_quiz_link'] click " do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("a[id='take_quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.first("button[id='answer4']")).to be_an_instance_of(Capybara::Node::Element)
    end 
    

    it "/quiz/:id should hide quiz info on a[id='take_quiz_link'] click" do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("a[id='take_quiz_link']").click 
        sleep 0.1
        expect(Capybara.page.first("h3", :visible => false )).to be_an_instance_of(Capybara::Node::Element)
    end 

    it "/quiz/:id should show next question on a[class='answer_link'] click" do 
        capybara_quizzes_index
        Capybara.page.first("a[class='quiz_link'").click 
        sleep 0.1
        Capybara.page.first("a[id='take_quiz_link']").click 
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
        Capybara.page.first("a[id='take_quiz_link']").click 
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
        Capybara.page.first("a[id='take_quiz_link']").click 
        sleep 0.1
        for i in (0..3)
            Capybara.page.first("button[class='answer_link']").click 
        end 
        sleep 0.1
        expect(Capybara.page.first("h4[id='save_score_status']").text).not_to eq("")
        expect(Capybara.page.first("button[id='replay_quiz_button']").text).not_to eq("")
    end
    
end

RSpec.describe "quizzes/new" do 
    
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
        Capybara.fill_in("quiz_total_questions", with: "10")
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

end 
