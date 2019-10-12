require "helpers"

RSpec.configure do |c|
    c.include Helpers
end


RSpec.describe Score do 

    it "testing helper function" do 
        expect(help).to be(:available)
    end 

end 