Rails.application.routes.draw do

  get 'quiz/new_quiz_to_collection', to: 'quiz#new_quiz_to_collection', :collection_id => 2, :question => "This is test question 2?", :answer => "This is test answer 2" 
  get 'quiz/new_quiz'
  get 'quiz/quizzes'
  get 'quiz/error'
  get 'quiz/show_quiz'
  get 'start_quiz/welcome'
  get 'start_quiz/start'
  get 'collection/new_collection'
  get 'collection/show_collection_by_id'
  get 'user/guest_user', to: 'user#guest_user'
  get 'user/user_login', to: 'user#user_login'
  get 'user/user_profile', to: 'user#user_profile'
  get 'user/user_registration', to: 'user#user_registration'
  get 'session/guest_user', to: 'session#guest_user'

  put 'quiz/update_quiz_by_id', to: 'quiz#update_quiz_by_id'
  put 'collection/update_collection_by_id', to: 'collection#update_collection_by_id'

  post 'user/create', to: 'user#create'  
  post 'user/user_login', to: 'user#user_login'
  post 'session/create', to: 'session#create'


  delete 'quiz/delete_quiz_by_id', to: 'quiz#delete_quiz_by_id'
  delete 'collection/delete_collection_by_id', to: 'collection#delete_collection_by_id'
end