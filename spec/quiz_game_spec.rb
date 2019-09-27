require "helpers"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe QuizGame do 
    
    it "/ route should render navbar with 4 links" do 
        Capybara.visit("/")
        expect(Capybara.page.all("a")[3]).to be_an_instance_of(Capybara::Node::Element) 
    end 

    it "from: /, 'Register' link should take to: /new " do 
        Capybara.visit("/")
        old_path = Capybara.page.current_path
        Capybara.page.all("a")[0].click
        new_path = Capybara.page.current_path
        expect(new_path).not_to eq(old_path)
    end 

    it "from: /, quiz_games/quiz should " do 
        capybara_login
        Capybara.page.first("a[id='quizzes_link']").click 

    end 

end 