
module QuizzesHelper
    
    def capybara_new_quiz_fill_in
        Capybara.current_driver = Capybara.javascript_driver
        capybara_quiz_view
        Capybara.page.first("input[id='add_questions_link']").click 
        sleep 0.1
        Capybara.fill_in("question", with: "This is a sample question?")
        Capybara.fill_in("answer1", with: "Sample answer 1")
        Capybara.fill_in("answer2", with: "Sample answer 2")
        Capybara.fill_in("answer3", with: "Sample answer 3")
        Capybara.fill_in("answer4", with: "Sample answer 4")
        Capybara.page.first("input[type='checkbox']").set(true)
        sleep 0.1
    end 


    def capybara_new_quiz
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing1") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
        Capybara.page.first("a[id='quizzes_link']").click
        sleep 0.1
        Capybara.page.first("input[id='new_quiz_link']").click 
        sleep 0.1
        old_path = Capybara.page.current_path 
        Capybara.fill_in("quiz_name", with: "testing1")
        Capybara.fill_in("quiz_category", with: "testing1")
        Capybara.fill_in("quiz_description", with: "testing1")
        Capybara.page.first("input[id='submit_new_quiz_link']").click
        sleep 0.1
    end 

    def capybara_quiz_view 
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing1") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
        Capybara.page.first("a[id='quizzes_link']").click
        sleep 0.1
        Capybara.page.first("a[class='quiz_link']").click 
        sleep 0.1
    end 

    def capybara_quizzes_index
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("username", with: "testing1")
        Capybara.fill_in("password", with: "testing1") 
        Capybara.page.first("input[type='submit']").click
        sleep 0.1
        Capybara.page.first("a[id='quizzes_link']").click
        sleep 0.1
    end 
end
