Rails.application.routes.draw do
  root 'quizzes#index'
  resource :sessions
  resources :users
  resources :quizzes
  resources :questions
  resource :answers
  resources :password_resets
  resources :quiz_categories
  get "save_score", to: "quizzes#save_score"
  
end