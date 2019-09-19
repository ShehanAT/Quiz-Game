class UserControllerTest < ActionDispatch::IntegrationTest

    test "the truth" do 
        assert true
    end 

    test "should submit registration form, return 200 status code" do 
        Capybara.visit("/user/register")
        Capybara.within("form") do
            Capybara.fill_in "username", :with => "testing1"
            Capybara.fill_in "email", :with => "testing1@testing1.com"
            Capybara.fill_in "password", :with => "testing1"
            Capybara.fill_in "password_confirmation", :with => "testing1"
            Capybara.fill_in "fullName", :with => "Testing1 Testing1"
            Capybara.fill_in "bio", :with => "Testing1"
            Capybara.find("input[value='Register']").click
            assert_equal(200, Capybara.page.status_code)
        end 
    end 

    test "should show error message in view upon empty registration form submission" do
        begin
        Capybara.visit("/user/register") 
        Capybara.within("form") do 
            user = User.new 
            Capybara.fill_in "username", :with => ""
            Capybara.fill_in "email", :with => ""
            Capybara.fill_in "password", :with => ""
            Capybara.fill_in "password_confirmation", :with => ""
            Capybara.fill_in "fullName", :with => ""
            Capybara.fill_in "bio", :with => ""
            Capybara.find("input[value='Register']").click
            assert Capybara.find("div[class='error_messages']")
        rescue Capybara::RackTest::Errors::StaleElementReferenceError
            sleep 1 
            retry
        end    
        end 
    end 

    test "should not redirect user/register on form submit" do 
        
    end 
end