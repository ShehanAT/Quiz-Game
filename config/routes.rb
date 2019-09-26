Rails.application.routes.draw do
  root 'quiz_games#home'
  resource :attempts
  resource :sessions
  resource :users
  resource :quizzes
  resource :questions
  resource :answers
end