require 'rails_helper'
require "helpers"

RSpec.configure do |c|
    c.include Helpers
end


RSpec.describe UsersController, type: :controller do

    it "from: /users/new form submission should be successful with valid form data" do 
        old_path = Capybara.page.current_path
        capybara_login
        new_path = Capybara.page.current_path
        expect(old_path).not_to eq(new_path)
    end 



end 
