require "spec_helper"
require "helpers/sessions_helper_spec"
require "helpers/users_helper_spec"
require "helpers/quizzes_helper_spec"
require "helpers/questions_helper_spec"
require "helpers/password_resets_helper_spec"

RSpec.configure do |c|
    c.include SessionsHelper
    c.include UsersHelper
    c.include QuizzesHelper 
    c.include QuestionsHelper
    c.include PasswordResetsHelper 
end

RSpec.describe PasswordResetsHelper do
    it "should redirect to /password_resets/new on btn click" do
        capybara_no_auth
        Capybara.page.first("a[id='password_reset_link']").click 
        expect(Capybara.page.current_path).to eq("/password_resets/new")
    end 

    it "show redirect to root_url after new form submit" do 
        capybara_no_auth 
        Capybara.page.first("a[id='password_reset_link']").click 
        Capybara.fill_in("email", with: "shehanatuk@gmail.com")
        Capybara.page.first("input[id='reset_password_submit']").click 
        sleep 0.5
        expect(Capybara.page.current_path).to eq("/")
    end 
end
