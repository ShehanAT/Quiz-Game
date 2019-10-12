module SessionsHelper

    def invalid_capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing") 
        Capybara.page.first("input[type='submit']").click
    end 

    def capybara_logout 
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "admin")
        Capybara.fill_in("password", with: "admin") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
        Capybara.find("a", :text => /\ALog Out\z/).click 
        sleep 0.1
    end

    def capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing1") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.5
    end

    def capybara_login_admin
        Capybara.current_driver = Capybara.javascript_driver 
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "admin")
        Capybara.fill_in("password", with: "admin")
        Capybara.page.first("input[type='submit']").click 
        sleep 0.5
    end 

    def caypbara_login_page 
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
    end 
    
end 