Rails.application.routes.draw do
  resource :games
  get '', to: 'start_quiz#start'
  get '/welcome', to: 'start_quiz#welcome'
  get 'quiz/new_question_to_quiz', to: 'quiz#new_question_to_quiz', :quiz_id => 2, :question => "This is test question 2?", :answer => "This is test answer 2" 
  get 'question/new_question'
  get 'question/questions'
  get 'question/error'
  get 'question/show_question'
  get 'question/new_question_to_quiz'
  get 'quiz/new_quiz'
  get 'quiz/show_quiz_by_id'
  get 'user/guest_user', to: 'user#guest_user'
  get 'user/user_login', to: 'user#user_login'
  get 'user_profile', to: 'session#user_profile'
  get 'user/register', to: 'user#new'
  get 'session/login', to: 'session#new', remote: true
  get 'session/guest_user', to: 'session#guest_user'
  get 'quizGame', to:'games#start_game'
  get 'endGame', to:'games#end_game'
  get 'quiz_list', to: 'start_quiz#quiz_list'

  put 'quiz/update_quiz_by_id', to: 'quiz#update_quiz_by_id'
  put 'question/update_question_by_id', to: 'question#update_question_by_id'

  post 'user/create', to: 'user#create'  
  post 'user/user_login', to: 'user#user_login'
  post 'session/login', to: 'session#create'

  delete 'quiz/delete_quiz_by_id', to: 'quiz#delete_quiz_by_id'
  delete 'question/delete_question_by_id', to: 'question#delete_question_by_id'
end