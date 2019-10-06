require "helpers"

RSpec.configure do |c|
    c.include Helpers
end


RSpec.describe Score do 

    it "testing helper function" do 
        expect(help).to be(:available)
    end 

    it "from: /sessions/new, invalid login form submission should not redirect to root_url" do
        capybara_login 
        expect(Capybara.page.current_path).to eq("/")
    end

    it "login => logout, should redirect to root_url" do 
        capybara_logout
        expect(Capybara.page.current_path).to eq("/")
    end 
end 