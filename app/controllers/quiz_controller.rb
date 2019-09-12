class QuizController < ApplicationController
  def quizzes
    @collection = Collection.all 
    # <td><%= link_to "Show", book %></td>
    # <td><%= link_to "Edit", edit_book_path(book) %></td>
    # <td><%= link_to "Destroy", book, method: :delete, data: { confirm: "Are you sure?" } %></td>
  end

  def sample_populate  
    @collection = Collection.create(:collection_id => 1, :name => "Sample Collection")
    for a in 1..5 do
      @collection.quiz.create(:question => "This is sample question ##{a}?", :answer => "This is sample answer ##{a}")
      if @collection.save!
        puts "Sample quiz ##{a} saved"
      else 
        puts "Sample quiz ##{a} not saved"
      end 
    end 
    redirect_to action: "quizzes"
  end

  def create_quizzes
    @sample = Sample.new()
    # puts @sample.question
    if @sample.save 
      puts "Quiz was saved"
    else 
      puts "Quiz was not saved"
    end
    redirect_to "quiz/quizzes" 
  end 

  def quiz_quiz_url(quiz_url)
    redirect_to "#{quiz_url}"
  end

  def show_quiz(quiz_url)
    render "#{quiz_url}"
  end

  def random_redirect 
    redirect_to "quiz/quizzes"
  end 

 
  def new_quiz
    render "new_quiz"
  end

  def quiz
    @quiz = Quiz.new 
    @quiz.question = "Sample Question?"
    @quiz.answer = "Sammple Answer"
    if @quiz.save 
      redirect_to @quiz
    else 
      render "error_quiz" 
    end 
  end

  def quiz_url
      render "quiz/quiz"
  end  

  def new_quiz_url
      render "new_quiz_url"
  end

  def error 
    render "error_quiz"
  end 
end
