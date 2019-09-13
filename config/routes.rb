Rails.application.routes.draw do

  get 'quiz/new_quiz_url'
  get 'quiz/random_redirect'
  get 'quiz/error'
  get 'quiz/new_quiz_url'
  get 'quiz/edit_quiz_url'
  get 'quiz/quiz_show_quiz_url', to: 'quiz#show_quiz'
  patch 'quiz/quiz_url'
  delete 'quiz/quiz_url'
  get 'quiz/quiz_url', to: 'quiz#quiz_url'
  get 'quiz/new_quiz_to_collection', to: 'quiz#new_quiz_to_collection', :collection_id => 2, :question => "This is test question 2?", :answer => "This is test answer 2" 
  delete 'quiz/delete_quiz_by_id', to: 'quiz#delete_quiz_by_id'
 
  post 'quiz/quizzes_url'
  
  get 'quiz/new_quiz'


  post 'quiz/quizzes'
  get 'quiz/quizzes'
  post 'quiz/create_quizzes'
  
 
  get 'start_quiz/welcome'
  get 'start_quiz/start'
  post 'start_quiz/start'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end