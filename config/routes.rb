Rails.application.routes.draw do
  root 'quizzes#home'
  resources :attempts
  resource :sessions
  resources :users
  resources :quizzes
  resources :questions
  resource :answers
  get "save_score", to: "quizzes#save_score"
  get "username_validations", to: "users#username_validations"
  get "email_validations", to: "users#email_validations"
  post "update_password", to: "users#update_password"

end