RSpec.describe StartQuizController do
    it "after /quizGame => /quiz_list should contain minimun of 4 links" do
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/session/login")
        Capybara.fill_in 'username', :with => 'admin'
        Capybara.fill_in 'password', :with => 'admin'
        Capybara.find("input[value='Login']").click 
        sleep 0.5
        Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
        Capybara.find("#startQuizButton").click 
        sleep 0.5
        for i in 0..3
          Capybara.page.first("input[type='submit']").click
          sleep 0.1
        end 
        Capybara.page.first("a[id='quizList']").click 
        sleep 0.1 
        expect(Capybara.page.all("input[type='submit']")[3]).to be_an_instance_of(Capybara::Node::Element) 

    end 






end 