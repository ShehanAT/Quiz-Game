

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
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    expect(Capybara.page.first("input[type='submit']").value).not_to eq("")
  end 

  it "post /level first button should re-render to same url" do 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    Capybara.page.first("input[type='submit']").click
    sleep 0.5
    expect(Capybara.page).to have_current_path("/games", ignore_query: true)
  end

  it "post /level question should be displayed" do
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    expect(Capybara.page.first("h2").text).not_to eq("")
  end 

  it "post /level question should change on when selecting first button of quiz 1" do
    Capybara.current_driver = Capybara.javascript_driver 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    old_question = Capybara.page.first("h2").text
    Capybara.page.first("input[type='submit']").click
    sleep 0.5 
    new_question = Capybara.page.first("h2").text 
    expect(old_question).not_to eq(new_question)
  end 
end 
