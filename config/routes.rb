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