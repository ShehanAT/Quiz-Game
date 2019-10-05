Rails.application.routes.draw do
  root 'quizzes#home'
  resources :attempts
  resource :sessions
  resource :users
  resources :quizzes
  resources :questions
  resource :answers
  get "save_score", to: "quizzes#save_score"
end