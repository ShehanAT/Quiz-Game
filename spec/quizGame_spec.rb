RSpec.describe QuizGame do
  it "has a version number" do
    expect(QuizGame::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end
end
RSpec.describe QuizGame do 

  it "four clickable pieces should contain Question.question value for text field" do 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    expect(Capybara.page.first("#choice1").text).to eq("Choice #1")
  end 
  
end
