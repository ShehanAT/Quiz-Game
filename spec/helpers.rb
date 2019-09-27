module Helpers 
    def capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing1") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
    end

    def capybara_logout 
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing1") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
        Capybara.find("a", :text => /\ALog Out\z/).click 
        sleep 0.1
    end

    def invalid_capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/")
        Capybara.find("a", :text => /\ALogin\z/).click 
        sleep 0.1 
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing") 
        Capybara.page.first("input[type='submit']").click
    end 

    def capybara_quizzes_index
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing1") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
        Capybara.page.first("a[id='quizzes_link']").click
        sleep 0.1
    end 

    def help 
        :available 
    end 

end 