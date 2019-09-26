module Helpers 
    def capybara_login
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/")
        Capybara.find("a", :text => /\ALogin\z/).click 
        sleep 0.1 
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing1") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
    end

    def invalid_capybara_login
        Capybara.visit("/")
        Capybara.find("a", :text => /\ALogin\z/).click 
        sleep 0.1 
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing") 
        Capybara.page.first("input[type='submit']").click
    end 

    def help 
        :available 
    end 

end 