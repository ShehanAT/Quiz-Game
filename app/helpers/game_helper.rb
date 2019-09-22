module GameHelper
    def render_quiz_question(quiz)
        content_tag(:h2, "Question: " << quiz.question, id: "quiz_question")
    end 

end
