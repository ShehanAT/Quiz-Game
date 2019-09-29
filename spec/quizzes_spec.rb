require "helpers"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe QuizGame do 
    
    it "/ route should render navbar with 4 links" do 
        Capybara.visit("/")
        expect(Capybara.page.all("a")[3]).to be_an_instance_of(Capybara::Node::Element) 
    end 

  

  

end 