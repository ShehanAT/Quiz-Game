module SessionsHelper

    def invalid_capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing") 
        Capybara.page.first("input[id='content_login_link']").click
        sleep 0.5
        Capybara.page.driver.browser.switch_to.alert.accept
        sleep 0.5
    end 

    def capybara_logout 
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='content_login_link']").click
        sleep 0.1
        Capybara.page.first("a[id='logout_link']").click 
        sleep 0.1
    end

    def capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='content_login_link']").click
        sleep 0.5
    end

    def capybara_login_admin
        Capybara.current_driver = Capybara.javascript_driver 
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='content_login_link']").click
        sleep 0.5
    end 
end 