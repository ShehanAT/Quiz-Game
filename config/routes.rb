Rails.application.routes.draw do
  root 'quizzes#home'
  resource :attempts
  resource :sessions
  resource :users
  resource :quizzes
  resource :questions
  resource :answers
end