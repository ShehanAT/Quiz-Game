require "spec_helper"
require "helpers/sessions_helper_spec"
require "helpers/users_helper_spec"
require "helpers/quizzes_helper_spec"
require "helpers/questions_helper_spec"
require "helpers/quiz_categories_helper_spec"
require "helpers/application_helper_spec"
RSpec.configure do |c|
    c.include SessionsHelper
    c.include UsersHelper
    c.include QuizzesHelper 
    c.include QuestionsHelper
    c.include ApplicationHelper
end

RSpec.describe QuizCategoriesHelper do

    # it "should navigate to /quiz_categories/:id after new category created" do 
    #     capybara_new_quiz_no_images
    #     Capybara.visit("/quiz_categories/1")
    #     expect(Capybara.page.first("h3[id='category_title']")).not_to eq("")
    # end 

end 