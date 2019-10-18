
module QuizzesHelper
    
    def capybara_new_quiz_images
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='login_link']").click
        Capybara.page.first("a[id='new_quiz_link']").click 
        Capybara.fill_in("quiz_name", with: "testing1")
        Capybara.fill_in("quiz_category", with: "testing1")
        Capybara.fill_in("quiz_description", with: "testing1")
        Capybara.find('#quiz_contains_images').find(:xpath, 'option[1]').select_option
        Capybara.page.first("input[id='submit_new_quiz_link']").click
        sleep 0.5
    end 


    def capybara_new_quiz_no_images
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='login_link']").click
        Capybara.page.first("a[id='new_quiz_link']").click 
        Capybara.fill_in("quiz_name", with: "testing1")
        Capybara.fill_in("quiz_category", with: "testing1")
        Capybara.fill_in("quiz_description", with: "testing1")
        Capybara.find('#quiz_contains_images').find(:xpath, 'option[1]').select_option
        Capybara.page.first("input[id='submit_new_quiz_link']").click
    end 

    def capybara_quiz_view 
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='login_link']").click
        sleep 0.1
        Capybara.page.first("a[class='quiz_link']").click 
        sleep 0.1
    end 
end
