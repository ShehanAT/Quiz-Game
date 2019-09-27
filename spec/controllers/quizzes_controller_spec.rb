
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
end

# <% if false %>
# <%= link_to "#{quiz.name}", quizzes_path, :id => quiz.id, :class => "quiz_link %>
# <br />
# <%= link_to "Quizzes", quizzes_path %>
# <% end %> 
