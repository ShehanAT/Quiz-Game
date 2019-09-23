module GameHelper
    def render_quiz_question(question)
        content_tag(:h2, "Question: " << question.question, id: "quiz_question")
    end 

    def render_quiz_score(session)
        content_tag(:h2, "Your Score: " << session, id: "quiz_score")
    end     

end
