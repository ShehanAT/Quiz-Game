RSpec.describe StartQuizController do
    it "/quiz_list should contain minimun 4 links to /quizGame" do
      Capybara.current_driver = Capybara.javascript_driver
      Capybara.visit("/session/login")
      Capybara.fill_in 'username', :with => 'admin'
      Capybara.fill_in 'password', :with => 'admin'
      Capybara.find("input[value='Login']").click 
      sleep 0.5
      Capybara.page.first("a[class='quiz_link']").click
      sleep 0.5
      Capybara.page.first("button[id='start_quiz']").click
      sleep 0.1
      for i in 0..3
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
      end 
      Capybara.page.first("a[id='quizList']").click 
      sleep 0.1 
      expect(Capybara.page.all("a[class='quiz_link']")[3]).to be_an_instance_of(Capybara::Node::Element) 
    end 

    it "/welcome should contain minimum 4 links to /quizGame" do 
      Capybara.current_driver = Capybara.javascript_driver
      Capybara.visit("/session/login")
      Capybara.fill_in 'username', :with => 'admin'
      Capybara.fill_in 'password', :with => 'admin'
      Capybara.find("input[value='Login']").click 
      sleep 0.5
      expect(Capybara.page.all("a[class='quiz_link']")[3]).to be_an_instance_of(Capybara::Node::Element)
    end 
end 