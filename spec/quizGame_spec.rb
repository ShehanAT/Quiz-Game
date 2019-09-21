

RSpec.describe Quiz do
  quiz = Quiz.new 
  it "does something useful" do
    expect(false).to eq(false)
  end
end 

RSpec.describe Answer do 
  answer = Answer.find(1)
  it "post /level buttons should contain Question.question value for text field" do 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    expect(Capybara.page.first("input[type='submit']").value).to eq("#{answer.answer}")
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
    quiz = Quiz.find(1)
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    Rails.logger.info "The first question is #{quiz.question}"
    expect(Capybara.page.first("h2").text).to eq("Question: #{quiz.question}")
  end 

end 
