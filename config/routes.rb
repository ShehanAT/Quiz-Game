Rails.application.routes.draw do
  get 'quiz/new_quiz_url'
  get 'quiz/quizzes'
  post 'quiz/create_quizzes'
  post 'quiz/quizzes_url'
  post 'quiz/quizzes'
  get 'quiz/new_quiz'
  get 'quiz/quiz'
  get 'quiz/error'
  get 'quiz/new_quiz_url'
  get 'quiz/edit_quiz_url'
  get 'quiz/quiz_url'
  patch 'quiz/quiz_url'
  delete 'quiz/quiz_url'
  get 'quizzes/new_quiz_url'
  get 'start_quiz/welcome'
  get 'start_quiz/start'
  post 'start_quiz/start'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end