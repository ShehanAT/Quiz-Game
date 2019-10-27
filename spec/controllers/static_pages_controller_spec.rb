require 'rails_helper'
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


RSpec.describe StaticPagesHelper do 

    it "about link should redirect to /static_pages/about" do 
        capybara_login 
        Capybara.page.first("a[id='about_link']").click 
        expect(Capybara.page.current_path).to eq("/static_pages/about")
    end 

    it "faq link should redirect to /static_pages/faq" do 
        capybara_login 
        Capybara.page.first("a[id='faq_link']").click 
        expect(Capybara.page.current_path).to eq("/static_pages/faq")
    end 

    it "disclaimer link should redirect to /static_pages/disclaimer" do 
        capybara_login 
        Capybara.page.first("a[id='disclaimer_link']").click 
        expect(Capybara.page.current_path).to eq("/static_pages/disclaimer")
    end 

    it "contact link should redirect to /static_pages/contact" do 
        capybara_login 
        Capybara.page.first("a[id='contact_link']").click 
        expect(Capybara.page.current_path).to eq("/static_pages/contact")
    end 



end
