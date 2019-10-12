module PasswordResetsHelper 
    
  def capybara_password_reset
    Capybara.current_driver = Capybara.javascript_driver
    Capybara.visit("/sessions/new")
    Capybara.page.first("a[id='password_reset_link']").click 
  end 


end 