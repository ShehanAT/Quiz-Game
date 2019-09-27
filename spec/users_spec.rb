RSpec.describe User do 

    it "from: /users/new form submission should be successful with valid form data" do 
        Capybara.visit("/")
        Capybara.page.all("a")[0].click
        old_path = Capybara.page.current_path
        Capybara.fill_in "user_username", with: "test1"
        Capybara.fill_in "user_password", with: "test1"
        Capybara.fill_in "user_password_confirmation", with: "test"
        Capybara.fill_in "user_email", with: "test1@test1.com"
        Capybara.fill_in "user_fullName", with: "test1"
        Capybara.fill_in "user_bio", with: "test1"
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
        new_path = Capybara.page.current_path
        expect(old_path).not_to eq(new_path)
    end 

end 
