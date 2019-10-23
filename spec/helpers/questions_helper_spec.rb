module QuestionsHelper 

    def capybara_new_quiz_question_no_image
        capybara_new_quiz_no_images
        Capybara.page.first("a[id='add_questions_link']").click 
        sleep 0.1 
        Capybara.fill_in("question", with: "what is the circumference of the Earth?")
        Capybara.fill_in("answer1", with: "10000 miles")
        Capybara.fill_in("answer2", with: "20000 miles")
        Capybara.fill_in("answer3", with: "30000 miles")
        Capybara.fill_in("answer4", with: "40000 miles")
    end 

    def capybara_new_quiz_question_image 
        capybara_new_quiz_images 
        sleep 0.5
        Capybara.page.first("a[id='add_questions_link']").click 
        sleep 0.1 
        Capybara.fill_in("question", with: "what is the circumference of the Earth?")
        Capybara.fill_in("answer1", with: "10000 miles")
        Capybara.fill_in("answer2", with: "20000 miles")
        Capybara.fill_in("answer3", with: "30000 miles")
        Capybara.fill_in("answer4", with: "40000 miles")
        Capybara.attach_file("Upload Question Image", Rails.root + "public/apple-touch-icon.png")
    end

    def capybara_questions_index
        Capybara.current_driver = Capybara.javascript_driver
        Capybara.visit("/sessions/new")
        Capybara.fill_in("login_username", with: "testing1")
        Capybara.fill_in("login_password", with: "testing1") 
        Capybara.page.first("input[id='content_login_link']").click
        sleep 0.5
        Capybara.page.first("a[id='questions_link']").click
    end 



end 