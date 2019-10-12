require 'rails_helper'
require "helpers"

RSpec.configure do |c|
    c.include Helpers
end



RSpec.describe SessionHelper do 


    it "forgot password link should redirect" do 
        capybara_password_reset
        expect(Capybara.page.current_path).to eq("/password_resets/new")
    end 

    it "should show error msg on empty email submit " do 
        capybara_password_reset 
        Capybara.page.first("input[id='reset_password_submit']").click
        expect(Capybara.page.first("p[class='error']").text).to eq("Email Not Found! Please Enter A Valid Email")
    end 

    it "should redirect to root url on email submit" do 
        capybara_password_reset
        Capybara.fill_in("email", with: "shehanatuk@gmail.com")
        Capybara.page.first("input[id='reset_password_submit']").click 
        sleep 0.5
        expect(Capybara.page.current_path).to eq("/")
    end 



    it "from: /sessions/new, invalid login form submission should not redirect to root_url" do
        invalid_capybara_login 
        expect(Capybara.page.current_path).to eq("/sessions/new")
    end

    it "valid login form submission should redirect to root_url" do 
        capybara_login
        expect(Capybara.page.current_path).to eq("/")
    end 

    it "login => logout, should redirect to root_url" do 
        capybara_logout
        expect(Capybara.page.current_path).to eq("/")
    end 


end 