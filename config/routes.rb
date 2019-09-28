Rails.application.routes.draw do
  root 'quizzes#home'
  resources :attempts
  resource :sessions
  resource :users
  resources :quizzes
  resource :questions
  resource :answers
  get "save_score", to: "quizzes#save_score"
end