module SessionsHelper

    def invalid_capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing") 
        Capybara.page.first("input[id='login_link']").click
    end 

    def capybara_logout 
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='login_link']").click
        sleep 0.1
        Capybara.find("a", :text => /\ALog Out\z/).click 
        sleep 0.1
    end

    def capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='login_link']").click
        sleep 0.5
    end

    def capybara_login_admin
        Capybara.current_driver = Capybara.javascript_driver 
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='login_link']").click
        sleep 0.5
    end 
end 