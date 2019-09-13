Rails.application.routes.draw do

  get 'quiz/new_quiz_to_collection', to: 'quiz#new_quiz_to_collection', :collection_id => 2, :question => "This is test question 2?", :answer => "This is test answer 2" 
  get 'quiz/new_quiz'
  get 'quiz/quizzes'
  get 'quiz/error'
  get 'start_quiz/welcome'
  get 'start_quiz/start'

  put 'quiz/update_quiz_by_id', to: 'quiz#update_quiz_by_id'

  delete 'quiz/delete_quiz_by_id', to: 'quiz#delete_quiz_by_id'
end