RSpec.describe QuizGame do
  it "has a version number" do
    expect(QuizGame::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
RSpec.describe QuizGame do 
  game = Game.new
  it "has a Game object called game" do 
    expect(game).not_to be nil
  end 
