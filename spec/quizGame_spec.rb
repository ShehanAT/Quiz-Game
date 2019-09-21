

RSpec.describe Quiz do
  quiz = Quiz.new 
  it "does something useful" do
    expect(false).to eq(false)
  end
end 

RSpec.describe Answer do 
  answer = Answer.find(1)
  it "/start buttons should contain Question.question value for text field" do 
    Capybara.visit("/session/login")
    Capybara.fill_in 'username', :with => 'admin'
    Capybara.fill_in 'password', :with => 'admin'
    Capybara.find("input[value='Login']").click 
    sleep 0.5
    Capybara.find("#collection_select").find(:xpath, "option[2]").select_option
    Capybara.find("#startQuizButton").click 
    sleep 0.5
    expect(Capybara.page.first("#choice1").text).to eq("#{answer.answer}")
  end 

  # it "clicking a cli"

end 

