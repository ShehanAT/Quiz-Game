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
  get "username_validations", to: "users#username_validations"
  get "email_validations", to: "users#email_validations"
  post "change_password", to: "users#change_password"
  get "change_username", to: "users#change_username"
  get "change_email", to: "users#change_email"
  get "change_fullName", to: "users#change_fullName"

end