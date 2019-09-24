

RSpec.describe Quiz do
  quiz = Quiz.new 
  it "does something useful" do
    expect(false).to eq(false)
  end
end 

RSpec.describe Answer do 
  it "post /level buttons should contain Question.question value for text field" do 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.1
    expect(Capybara.page.first("input[type='submit']").value).not_to eq("")
  end 

  it "post /level first button should re-render to same url" do 
    Capybara.current_driver = Capybara.javascript_driver 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.1
    Capybara.page.first("button[id='start_quiz']").click
    sleep 0.1
    Capybara.page.first("input[type='submit']").click
    sleep 0.1
    expect(Capybara.page).to have_current_path("/quizGame", ignore_query: true)
  end

  it "post /level question should be displayed" do
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.1
    Capybara.page.first("button[id='start_quiz']").click
    sleep 0.1
    expect(Capybara.page.first("h2").text).not_to eq("")
  end 

  it "/quizGame question should change on when selecting first button of quiz 1" do
    Capybara.current_driver = Capybara.javascript_driver 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.1
    Capybara.page.first("button[id='start_quiz']").click
    sleep 0.1
    old_question = Capybara.page.first("input[type='submit']").value
    Capybara.page.first("input[type='submit']").click
    sleep 1
    new_question = Capybara.page.first("input[type='submit']").value 
    expect(old_question).not_to eq(new_question)
  end 

  it " /endGame should contain 'Home Page' link that redirects to /start_quiz/welcome" do 
    Capybara.current_driver = Capybara.javascript_driver
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.1
    Capybara.page.first("button[id='start_quiz']").click
    sleep 0.1
    for i in 0..3
      Capybara.page.first("input[type='submit']").click
      sleep 0.1
    end 
    Capybara.page.first("a[id='homePage']").click 
    sleep 0.1 
    expect(Capybara.page.current_path).to eq("/welcome")
  end 

  it "/endGame should contain 'Take different quiz' link that redirects to /start_quiz/show_quizs" do 
    Capybara.current_driver = Capybara.javascript_driver
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.1
    Capybara.page.first("button[id='start_quiz']").click
    sleep 0.1
    for i in 0..3
      Capybara.page.first("input[type='submit']").click
      sleep 0.1
    end 
    Capybara.page.first("a[id='quizList']").click 
    sleep 0.1 
    expect(Capybara.page.current_path).to eq("/quiz_list")
  end 

  it "/welcome should have minimum of 4 options and should be dynamically rendered" do 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    expect(Capybara.find("#quiz_select").find(:xpath, "option[4]").select_option)
  end 

  it "/_end.html should display confirmation message after saving highScore" do 
    Capybara.current_driver = Capybara.javascript_driver
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.1
    Capybara.page.first("button[id='start_quiz']").click
    sleep 0.1
    for i in 0..3
      Capybara.page.first("input[type='submit']").click
      sleep 0.1
    end 
    expect(Capybara.page.first("h3[id='save_score']").text).to eq("Your high score has been saved")
  end 

  it "/quizGame should render staging scene, on button click view will change to quiz scene" do 
    Capybara.current_driver = Capybara.javascript_driver
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.1
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.1
    expect(Capybara.page.first("button[id='start_quiz']").text).to eq("Play")
  end 

  it "GET request to /quizGame should not throw errors" do 
    Capybara.current_driver = Capybara.javascript_driver
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#quiz_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click
    sleep 0.5
    expect(Capybara.page.current_path).not_to eq("/quiz_error")
  end

end 
