module GameHelper
    def render_quiz_question(quiz)
        content_tag(:h2, "Question: " << quiz.question, id: "quiz_question")
    end 

    def render_quiz_score(session)
        content_tag(:h2, "Your Score: " << session, id: "quiz_score")
    end     

end
