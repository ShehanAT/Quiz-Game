Rails.application.routes.draw do
  root 'quizzes#index'
  resource :sessions
  resources :users
  resources :quizzes do 
    get :search_quizzes, on: :member
    get :save_score, on: :member
  end 
  resources :questions
  resource :answers
  resources :password_resets
  resources :quiz_categories
  get "static_pages/about"
  
end