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

end 