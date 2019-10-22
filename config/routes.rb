Rails.application.routes.draw do
  root 'quizzes#index'
  resource :sessions
  resources :users
  resources :quizzes do 
    get :search_quizzes, on: :member
  end 
  resources :questions
  resource :answers
  resources :password_resets
  resources :quiz_categories
  get "save_score", to: "quizzes#save_score"
  
end