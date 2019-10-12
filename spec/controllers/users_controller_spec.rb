require 'rails_helper'
require "helpers/sessions_helper_spec"
require "helpers/users_helper_spec"
require "helpers/quizzes_helper_spec"
require "helpers/questions_helper_spec"

RSpec.configure do |c|
    c.include SessionsHelper
    c.include UsersHelper
    c.include QuizzesHelper 
    c.include QuestionsHelper
end


RSpec.describe UserHelper do
    it "root_url should redirect to /users/:id on button click" do 
        capybara_login
        Capybara.page.first("a[id='user_profile_link']").click 
        expect(Capybara.page.current_path).to eq("/users/1") 
    end 

    it "/users/:id should display user info and redirect to /users/:id/edit" do 
        buttons = ["input[id='edit_user_link']", "input[id='back_link']"]
        for i in 0...2
            capybara_login
            Capybara.page.first("a[id='user_profile_link'").click 
            Capybara.page.first(buttons[i]).click
            if i === 0
                expect(Capybara.page.current_path).to eq("/users/1/edit")    
            elsif i === 1
                expect(Capybara.page.current_path).to eq("/")
            end 
        end
    end 

    it "/users/:id should display user info " do 
        capybara_login
        Capybara.page.first("a[id='user_profile_link'").click 
        expect(Capybara.page.first("h3[id='username']").text).to eq("Username: testing1")
        expect(Capybara.page.first("h3[id='email']").text).to eq("Email: shehanatuk@gmail.com")
        expect(Capybara.page.first("h3[id='fullName']").text).to eq("Full Name: Shehan Atukorala")
        expect(Capybara.page.first("h3[id='bio']").text).to eq("Bio: Shehan Atukorala")
    end 

    it "/users/:id/edit should display errors on invalid submit" do 
        capybara_login
        Capybara.page.first("a[id='user_profile_link']").click 
        Capybara.page.first("input[id='edit_user_link']").click 
        Capybara.page.first("button[id='change_password_link']").click 
        Capybara.page.first("button[id='update_password_link']").click 
        expect(Capybara.page.first("div[id='password_errors']").text).not_to eq("")
        Capybara.page.first("button[id='save_and_exit_link']").click 
        expect(Capybara.page.current_path).to eq("/")
    end 

    it "/users/:id/edit shoud display alert on valid password change" do 
        capybara_login
        Capybara.page.first("a[id='user_profile_link']").click 
        Capybara.page.first("input[id='edit_user_link']").click 
        Capybara.page.first("button[id='change_password_link']").click 
        Capybara.fill_in("current_password", with: "testing1")
        Capybara.fill_in("new_password", with: "admin")
        Capybara.fill_in("new_password_confirm", with: "admin")
        Capybara.page.first("button[id='update_password_link']").click 
        sleep 3
        expect(Capybara.page.driver.browser.switch_to.alert.text).to eq("Password Updated Successfully")
        Capybara.page.driver.browser.switch_to.alert.accept
    end 

    it "/users/:id/edit should display alert on valid username change" do 
        capybara_login
        Capybara.page.first("a[id='user_profile_link']").click 
        Capybara.page.first("input[id='edit_user_link']").click 
        Capybara.page.first("button[id='current_username']").click 
        Capybara.fill_in("new_username", with: "testing123")
        Capybara.page.first("button[id='update_username_link']").click
        sleep 3
        expect(Capybara.page.driver.browser.switch_to.alert.text).to eq("Username Updated Successfully")
        Capybara.page.driver.browser.switch_to.alert.accept
    end 

    it "/users/:id/edit should display alert on valid email change" do 
        capybara_login
        Capybara.page.first("a[id='user_profile_link']").click 
        Capybara.page.first("input[id='edit_user_link']").click 
        Capybara.page.first("button[id='current_email']").click 
        Capybara.page.first("button[id='update_email_link']").click
        sleep 3
        expect(Capybara.page.driver.browser.switch_to.alert.text).to eq("Email Updated Successfully")
        Capybara.page.driver.browser.switch_to.alert.accept
    end 

    it "/users/:id/edit should display alert on valid full name change" do 
        capybara_login
        Capybara.page.first("a[id='user_profile_link']").click 
        Capybara.page.first("input[id='edit_user_link']").click 
        Capybara.page.first("button[id='current_fullName']").click 
        Capybara.fill_in("new_fullName", with:"Shehan Atuk")
        Capybara.page.first("button[id='update_fullName_link']").click
        sleep 3
        expect(Capybara.page.driver.browser.switch_to.alert.text).to eq("Full Name Updated Successfully")
        Capybara.page.driver.browser.switch_to.alert.accept
    end 

    it "/users/:id/edit 'Delete Account' should redirect to root url logged out" do 
        capybara_login
        Capybara.page.first("a[id='user_profile_link']").click 
        Capybara.page.first("input[id='edit_user_link']").click 
        Capybara.page.first("button[id='delete_account_link']").click 
        Capybara.page.first("button[id='userDeleteYes']").click 
        expect(Capybara.page.current_path).to eq("/")        
    end 

end 
